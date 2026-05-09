; DESCRIPTION: Draws a orange line from (479, 218) to (17, 86).
; PLAN: r0=479(x1), r1=218(y1), r2=17(x2), r3=86(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 479
LDI r1, 218
LDI r2, 17
LDI r3, 86
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
