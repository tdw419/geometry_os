; DESCRIPTION: Draws a black line from (45, 108) to (66, 176).
; PLAN: r0=45(x1), r1=108(y1), r2=66(x2), r3=176(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 108
LDI r2, 66
LDI r3, 176
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
