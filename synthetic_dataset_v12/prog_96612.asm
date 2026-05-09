; DESCRIPTION: Draws a blue line from (217, 50) to (248, 254).
; PLAN: r0=217(x1), r1=50(y1), r2=248(x2), r3=254(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 50
LDI r2, 248
LDI r3, 254
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
