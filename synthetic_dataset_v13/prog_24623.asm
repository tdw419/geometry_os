; DESCRIPTION: Renders a cyan box of size 77x26 starting at (179, 228).
; PLAN: r0=179(x), r1=228(y), r2=77(width), r3=26(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 228
LDI r2, 77
LDI r3, 26
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
