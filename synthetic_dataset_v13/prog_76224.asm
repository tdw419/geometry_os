; DESCRIPTION: Renders a blue line between points (105, 237) and (284, 160).
; PLAN: r0=105(x1), r1=237(y1), r2=284(x2), r3=160(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 237
LDI r2, 284
LDI r3, 160
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
