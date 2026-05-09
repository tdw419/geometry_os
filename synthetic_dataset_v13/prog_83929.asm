; DESCRIPTION: Renders a black line between points (368, 186) and (272, 160).
; PLAN: r0=368(x1), r1=186(y1), r2=272(x2), r3=160(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 186
LDI r2, 272
LDI r3, 160
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
