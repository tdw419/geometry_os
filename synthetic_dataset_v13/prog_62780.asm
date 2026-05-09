; DESCRIPTION: Renders a purple line between points (64, 194) and (404, 154).
; PLAN: r0=64(x1), r1=194(y1), r2=404(x2), r3=154(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 194
LDI r2, 404
LDI r3, 154
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
