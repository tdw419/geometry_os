; DESCRIPTION: Draws a black line from (26, 231) to (240, 205).
; PLAN: r0=26(x1), r1=231(y1), r2=240(x2), r3=205(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 231
LDI r2, 240
LDI r3, 205
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
