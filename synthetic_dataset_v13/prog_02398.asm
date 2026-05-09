; DESCRIPTION: Renders a purple box of size 33x48 starting at (339, 80).
; PLAN: r0=339(x), r1=80(y), r2=33(width), r3=48(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 80
LDI r2, 33
LDI r3, 48
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
