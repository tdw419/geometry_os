; DESCRIPTION: Places a black line segment connecting (329, 219) to (292, 213).
; PLAN: r0=329(x1), r1=219(y1), r2=292(x2), r3=213(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 219
LDI r2, 292
LDI r3, 213
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
