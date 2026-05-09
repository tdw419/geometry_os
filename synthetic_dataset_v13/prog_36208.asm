; DESCRIPTION: Renders a blue box of size 18x79 starting at (178, 54).
; PLAN: r0=178(x), r1=54(y), r2=18(width), r3=79(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 54
LDI r2, 18
LDI r3, 79
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
