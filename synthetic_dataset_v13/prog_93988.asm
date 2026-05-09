; DESCRIPTION: Places a blue line segment connecting (284, 220) to (33, 234).
; PLAN: r0=284(x1), r1=220(y1), r2=33(x2), r3=234(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 220
LDI r2, 33
LDI r3, 234
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
