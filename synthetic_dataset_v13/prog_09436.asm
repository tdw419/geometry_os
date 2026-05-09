; DESCRIPTION: Renders a cyan box of size 114x81 starting at (268, 6).
; PLAN: r0=268(x), r1=6(y), r2=114(width), r3=81(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 6
LDI r2, 114
LDI r3, 81
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
