; DESCRIPTION: Renders a magenta line between points (404, 0) and (70, 253).
; PLAN: r0=404(x1), r1=0(y1), r2=70(x2), r3=253(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 0
LDI r2, 70
LDI r3, 253
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
