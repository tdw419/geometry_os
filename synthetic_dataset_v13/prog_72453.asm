; DESCRIPTION: Renders a white line between points (441, 205) and (489, 253).
; PLAN: r0=441(x1), r1=205(y1), r2=489(x2), r3=253(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 441
LDI r1, 205
LDI r2, 489
LDI r3, 253
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
