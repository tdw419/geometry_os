; DESCRIPTION: Renders a green line between points (318, 233) and (328, 243).
; PLAN: r0=318(x1), r1=233(y1), r2=328(x2), r3=243(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 233
LDI r2, 328
LDI r3, 243
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
