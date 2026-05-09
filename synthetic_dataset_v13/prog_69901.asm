; DESCRIPTION: Places a black line segment connecting (465, 86) to (463, 213).
; PLAN: r0=465(x1), r1=86(y1), r2=463(x2), r3=213(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 465
LDI r1, 86
LDI r2, 463
LDI r3, 213
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
