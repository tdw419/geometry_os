; DESCRIPTION: Renders a cyan box of size 64x106 starting at (26, 37).
; PLAN: r0=26(x), r1=37(y), r2=64(width), r3=106(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 37
LDI r2, 64
LDI r3, 106
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
