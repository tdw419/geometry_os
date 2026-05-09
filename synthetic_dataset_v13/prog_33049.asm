; DESCRIPTION: Renders a black line between points (272, 152) and (494, 78).
; PLAN: r0=272(x1), r1=152(y1), r2=494(x2), r3=78(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 152
LDI r2, 494
LDI r3, 78
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
