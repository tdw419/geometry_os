; DESCRIPTION: Draws a black line from (319, 231) to (469, 229).
; PLAN: r0=319(x1), r1=231(y1), r2=469(x2), r3=229(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 231
LDI r2, 469
LDI r3, 229
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
