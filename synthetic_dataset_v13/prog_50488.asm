; DESCRIPTION: Draws a green line from (309, 250) to (429, 86).
; PLAN: r0=309(x1), r1=250(y1), r2=429(x2), r3=86(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 250
LDI r2, 429
LDI r3, 86
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
