; DESCRIPTION: Renders a blue box of size 16x75 starting at (162, 140).
; PLAN: r0=162(x), r1=140(y), r2=16(width), r3=75(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 140
LDI r2, 16
LDI r3, 75
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
