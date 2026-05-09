; DESCRIPTION: Composite: Renders a yellow line between points (313, 51) and (366, 88) then Sets a single red pixel at (243, 7).
; PLAN: r0=313(x1), r1=51(y1), r2=366(x2), r3=88(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=243(x), r6=7(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 313
LDI r1, 51
LDI r2, 366
LDI r3, 88
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 243
LDI r6, 7
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
