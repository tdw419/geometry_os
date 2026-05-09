; DESCRIPTION: Renders a orange line between points (175, 253) and (509, 39).
; PLAN: r0=175(x1), r1=253(y1), r2=509(x2), r3=39(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 253
LDI r2, 509
LDI r3, 39
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
