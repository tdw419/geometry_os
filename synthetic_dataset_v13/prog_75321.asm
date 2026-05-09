; DESCRIPTION: Places a orange line segment connecting (6, 96) to (278, 213).
; PLAN: r0=6(x1), r1=96(y1), r2=278(x2), r3=213(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 96
LDI r2, 278
LDI r3, 213
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
