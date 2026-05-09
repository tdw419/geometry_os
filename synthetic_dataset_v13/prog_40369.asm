; DESCRIPTION: Renders a magenta line between points (129, 25) and (403, 111).
; PLAN: r0=129(x1), r1=25(y1), r2=403(x2), r3=111(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 25
LDI r2, 403
LDI r3, 111
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
