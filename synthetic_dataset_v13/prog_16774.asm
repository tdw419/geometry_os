; DESCRIPTION: Places a white line segment connecting (309, 145) to (211, 213).
; PLAN: r0=309(x1), r1=145(y1), r2=211(x2), r3=213(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 145
LDI r2, 211
LDI r3, 213
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
