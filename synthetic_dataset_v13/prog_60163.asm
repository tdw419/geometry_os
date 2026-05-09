; DESCRIPTION: Renders a orange line between points (151, 163) and (184, 111).
; PLAN: r0=151(x1), r1=163(y1), r2=184(x2), r3=111(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 163
LDI r2, 184
LDI r3, 111
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
