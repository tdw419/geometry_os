; DESCRIPTION: Renders a red line between points (385, 113) and (320, 48).
; PLAN: r0=385(x1), r1=113(y1), r2=320(x2), r3=48(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 113
LDI r2, 320
LDI r3, 48
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
