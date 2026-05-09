; DESCRIPTION: Renders a black line between points (114, 234) and (308, 125).
; PLAN: r0=114(x1), r1=234(y1), r2=308(x2), r3=125(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 234
LDI r2, 308
LDI r3, 125
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
