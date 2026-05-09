; DESCRIPTION: Draws a black line from (7, 1) to (270, 120).
; PLAN: r0=7(x1), r1=1(y1), r2=270(x2), r3=120(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 1
LDI r2, 270
LDI r3, 120
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
