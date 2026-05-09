; DESCRIPTION: Renders a purple line between points (287, 240) and (275, 174).
; PLAN: r0=287(x1), r1=240(y1), r2=275(x2), r3=174(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 240
LDI r2, 275
LDI r3, 174
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
