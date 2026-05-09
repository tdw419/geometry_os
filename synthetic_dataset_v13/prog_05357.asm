; DESCRIPTION: Draws a blue line from (46, 87) to (44, 176).
; PLAN: r0=46(x1), r1=87(y1), r2=44(x2), r3=176(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 87
LDI r2, 44
LDI r3, 176
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
