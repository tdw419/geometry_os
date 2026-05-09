; DESCRIPTION: Renders a blue line between points (198, 232) and (284, 8).
; PLAN: r0=198(x1), r1=232(y1), r2=284(x2), r3=8(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 232
LDI r2, 284
LDI r3, 8
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
