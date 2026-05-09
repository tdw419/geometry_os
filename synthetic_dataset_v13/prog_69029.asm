; DESCRIPTION: Places a green line segment connecting (343, 164) to (309, 213).
; PLAN: r0=343(x1), r1=164(y1), r2=309(x2), r3=213(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 164
LDI r2, 309
LDI r3, 213
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
