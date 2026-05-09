; DESCRIPTION: Renders a green line between points (510, 56) and (285, 111).
; PLAN: r0=510(x1), r1=56(y1), r2=285(x2), r3=111(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 510
LDI r1, 56
LDI r2, 285
LDI r3, 111
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
