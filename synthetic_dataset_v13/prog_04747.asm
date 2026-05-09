; DESCRIPTION: Draws a blue line from (248, 225) to (128, 14).
; PLAN: r0=248(x1), r1=225(y1), r2=128(x2), r3=14(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 225
LDI r2, 128
LDI r3, 14
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
