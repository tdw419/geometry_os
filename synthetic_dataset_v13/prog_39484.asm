; DESCRIPTION: Draws a black line from (320, 108) to (94, 9).
; PLAN: r0=320(x1), r1=108(y1), r2=94(x2), r3=9(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 108
LDI r2, 94
LDI r3, 9
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
