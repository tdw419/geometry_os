; DESCRIPTION: Renders a magenta line between points (347, 49) and (275, 183).
; PLAN: r0=347(x1), r1=49(y1), r2=275(x2), r3=183(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 49
LDI r2, 275
LDI r3, 183
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
