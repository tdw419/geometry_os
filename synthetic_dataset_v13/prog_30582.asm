; DESCRIPTION: Draws a purple line from (50, 149) to (258, 234).
; PLAN: r0=50(x1), r1=149(y1), r2=258(x2), r3=234(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 149
LDI r2, 258
LDI r3, 234
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
