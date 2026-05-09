; DESCRIPTION: Draws a black line from (273, 2) to (15, 125).
; PLAN: r0=273(x1), r1=2(y1), r2=15(x2), r3=125(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 2
LDI r2, 15
LDI r3, 125
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
