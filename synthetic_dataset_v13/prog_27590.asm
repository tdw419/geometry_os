; DESCRIPTION: Renders a blue box of size 104x52 starting at (26, 51).
; PLAN: r0=26(x), r1=51(y), r2=104(width), r3=52(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 51
LDI r2, 104
LDI r3, 52
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
