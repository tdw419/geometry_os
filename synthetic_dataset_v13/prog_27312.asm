; DESCRIPTION: Renders a black line between points (166, 117) and (303, 144).
; PLAN: r0=166(x1), r1=117(y1), r2=303(x2), r3=144(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 117
LDI r2, 303
LDI r3, 144
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
