; DESCRIPTION: Draws a cyan line from (201, 232) to (393, 123).
; PLAN: r0=201(x1), r1=232(y1), r2=393(x2), r3=123(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 232
LDI r2, 393
LDI r3, 123
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
