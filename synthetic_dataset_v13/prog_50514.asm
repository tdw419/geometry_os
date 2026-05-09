; DESCRIPTION: Renders a purple line between points (418, 174) and (443, 240).
; PLAN: r0=418(x1), r1=174(y1), r2=443(x2), r3=240(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 174
LDI r2, 443
LDI r3, 240
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
