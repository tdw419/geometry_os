; DESCRIPTION: Renders a blue box of size 92x44 starting at (110, 201).
; PLAN: r0=110(x), r1=201(y), r2=92(width), r3=44(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 201
LDI r2, 92
LDI r3, 44
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
