; DESCRIPTION: Renders a blue box of size 81x79 starting at (211, 164).
; PLAN: r0=211(x), r1=164(y), r2=81(width), r3=79(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 164
LDI r2, 81
LDI r3, 79
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
