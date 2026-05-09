; DESCRIPTION: Renders a black line between points (166, 195) and (130, 241).
; PLAN: r0=166(x1), r1=195(y1), r2=130(x2), r3=241(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 195
LDI r2, 130
LDI r3, 241
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
