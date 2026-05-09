; DESCRIPTION: Renders a purple box of size 119x32 starting at (163, 152).
; PLAN: r0=163(x), r1=152(y), r2=119(width), r3=32(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 152
LDI r2, 119
LDI r3, 32
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
