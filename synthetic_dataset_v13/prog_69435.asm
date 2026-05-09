; DESCRIPTION: Draws a cyan line from (347, 141) to (390, 108).
; PLAN: r0=347(x1), r1=141(y1), r2=390(x2), r3=108(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 141
LDI r2, 390
LDI r3, 108
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
