; DESCRIPTION: Renders a blue line between points (353, 225) and (504, 229).
; PLAN: r0=353(x1), r1=225(y1), r2=504(x2), r3=229(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 225
LDI r2, 504
LDI r3, 229
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
