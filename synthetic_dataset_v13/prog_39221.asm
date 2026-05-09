; DESCRIPTION: Renders a blue line between points (284, 243) and (185, 240).
; PLAN: r0=284(x1), r1=243(y1), r2=185(x2), r3=240(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 243
LDI r2, 185
LDI r3, 240
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
