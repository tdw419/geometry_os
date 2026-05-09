; DESCRIPTION: Draws a green line from (209, 91) to (309, 160).
; PLAN: r0=209(x1), r1=91(y1), r2=309(x2), r3=160(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 91
LDI r2, 309
LDI r3, 160
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
