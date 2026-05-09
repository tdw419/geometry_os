; DESCRIPTION: Renders a red line between points (139, 56) and (320, 239).
; PLAN: r0=139(x1), r1=56(y1), r2=320(x2), r3=239(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 56
LDI r2, 320
LDI r3, 239
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
