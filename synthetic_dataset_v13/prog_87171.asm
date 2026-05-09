; DESCRIPTION: Renders a red line between points (255, 234) and (500, 255).
; PLAN: r0=255(x1), r1=234(y1), r2=500(x2), r3=255(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 234
LDI r2, 500
LDI r3, 255
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
