; DESCRIPTION: Draws a black line from (340, 18) to (118, 196).
; PLAN: r0=340(x1), r1=18(y1), r2=118(x2), r3=196(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 18
LDI r2, 118
LDI r3, 196
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
