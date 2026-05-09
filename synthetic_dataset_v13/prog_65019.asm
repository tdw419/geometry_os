; DESCRIPTION: Draws a orange line from (65, 17) to (317, 132).
; PLAN: r0=65(x1), r1=17(y1), r2=317(x2), r3=132(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 17
LDI r2, 317
LDI r3, 132
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
