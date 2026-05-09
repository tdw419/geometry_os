; DESCRIPTION: Renders a black line between points (489, 211) and (117, 125).
; PLAN: r0=489(x1), r1=211(y1), r2=117(x2), r3=125(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 489
LDI r1, 211
LDI r2, 117
LDI r3, 125
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
