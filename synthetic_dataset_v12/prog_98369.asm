; DESCRIPTION: Renders a magenta line between points (321, 185) and (404, 224).
; PLAN: r0=321(x1), r1=185(y1), r2=404(x2), r3=224(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 185
LDI r2, 404
LDI r3, 224
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
