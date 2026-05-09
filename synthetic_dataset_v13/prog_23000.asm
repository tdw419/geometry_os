; DESCRIPTION: Renders a green line between points (423, 36) and (84, 111).
; PLAN: r0=423(x1), r1=36(y1), r2=84(x2), r3=111(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 423
LDI r1, 36
LDI r2, 84
LDI r3, 111
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
