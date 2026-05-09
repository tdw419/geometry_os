; DESCRIPTION: Renders a black line between points (275, 127) and (264, 58).
; PLAN: r0=275(x1), r1=127(y1), r2=264(x2), r3=58(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 127
LDI r2, 264
LDI r3, 58
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
