; DESCRIPTION: Renders a yellow line between points (449, 155) and (174, 111).
; PLAN: r0=449(x1), r1=155(y1), r2=174(x2), r3=111(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 449
LDI r1, 155
LDI r2, 174
LDI r3, 111
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
