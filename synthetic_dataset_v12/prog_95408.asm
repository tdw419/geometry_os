; DESCRIPTION: Renders a yellow line between points (75, 252) and (213, 111).
; PLAN: r0=75(x1), r1=252(y1), r2=213(x2), r3=111(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 252
LDI r2, 213
LDI r3, 111
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
