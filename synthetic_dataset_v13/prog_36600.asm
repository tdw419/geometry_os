; DESCRIPTION: Renders a blue line between points (269, 7) and (354, 49).
; PLAN: r0=269(x1), r1=7(y1), r2=354(x2), r3=49(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 7
LDI r2, 354
LDI r3, 49
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
