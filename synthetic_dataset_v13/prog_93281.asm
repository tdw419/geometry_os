; DESCRIPTION: Renders a yellow line between points (296, 64) and (181, 111).
; PLAN: r0=296(x1), r1=64(y1), r2=181(x2), r3=111(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 64
LDI r2, 181
LDI r3, 111
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
