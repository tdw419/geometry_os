; DESCRIPTION: Draws a green line from (309, 48) to (400, 9).
; PLAN: r0=309(x1), r1=48(y1), r2=400(x2), r3=9(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 48
LDI r2, 400
LDI r3, 9
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
