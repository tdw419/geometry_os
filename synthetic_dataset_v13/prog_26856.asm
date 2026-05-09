; DESCRIPTION: Draws a yellow line from (366, 175) to (178, 132).
; PLAN: r0=366(x1), r1=175(y1), r2=178(x2), r3=132(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 175
LDI r2, 178
LDI r3, 132
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
