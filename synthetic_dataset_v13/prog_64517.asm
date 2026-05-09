; DESCRIPTION: Places a orange line segment connecting (18, 179) to (118, 213).
; PLAN: r0=18(x1), r1=179(y1), r2=118(x2), r3=213(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 179
LDI r2, 118
LDI r3, 213
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
