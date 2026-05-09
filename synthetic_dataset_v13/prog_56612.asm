; DESCRIPTION: Draws a orange line from (217, 250) to (202, 151).
; PLAN: r0=217(x1), r1=250(y1), r2=202(x2), r3=151(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 250
LDI r2, 202
LDI r3, 151
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
