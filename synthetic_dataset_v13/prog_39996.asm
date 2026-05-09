; DESCRIPTION: Draws a black line from (97, 22) to (442, 231).
; PLAN: r0=97(x1), r1=22(y1), r2=442(x2), r3=231(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 22
LDI r2, 442
LDI r3, 231
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
