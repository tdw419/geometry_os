; DESCRIPTION: Places a orange line segment connecting (200, 143) to (326, 213).
; PLAN: r0=200(x1), r1=143(y1), r2=326(x2), r3=213(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 143
LDI r2, 326
LDI r3, 213
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
