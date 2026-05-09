; DESCRIPTION: Renders a purple box of size 33x104 starting at (163, 120).
; PLAN: r0=163(x), r1=120(y), r2=33(width), r3=104(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 120
LDI r2, 33
LDI r3, 104
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
