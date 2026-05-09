; DESCRIPTION: Draws a orange line from (309, 240) to (479, 58).
; PLAN: r0=309(x1), r1=240(y1), r2=479(x2), r3=58(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 240
LDI r2, 479
LDI r3, 58
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
