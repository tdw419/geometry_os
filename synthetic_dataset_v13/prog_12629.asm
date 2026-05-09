; DESCRIPTION: Renders a red line between points (433, 245) and (205, 253).
; PLAN: r0=433(x1), r1=245(y1), r2=205(x2), r3=253(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 433
LDI r1, 245
LDI r2, 205
LDI r3, 253
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
