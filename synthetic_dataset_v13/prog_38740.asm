; DESCRIPTION: Renders a blue line between points (303, 7) and (412, 86).
; PLAN: r0=303(x1), r1=7(y1), r2=412(x2), r3=86(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 7
LDI r2, 412
LDI r3, 86
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
