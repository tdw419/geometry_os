; DESCRIPTION: Renders a blue line between points (178, 129) and (306, 253).
; PLAN: r0=178(x1), r1=129(y1), r2=306(x2), r3=253(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 129
LDI r2, 306
LDI r3, 253
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
