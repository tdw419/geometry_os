; DESCRIPTION: Draws a orange line from (479, 195) to (63, 144).
; PLAN: r0=479(x1), r1=195(y1), r2=63(x2), r3=144(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 479
LDI r1, 195
LDI r2, 63
LDI r3, 144
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
