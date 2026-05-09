; DESCRIPTION: Places a blue line segment connecting (195, 206) to (393, 121).
; PLAN: r0=195(x1), r1=206(y1), r2=393(x2), r3=121(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 206
LDI r2, 393
LDI r3, 121
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
