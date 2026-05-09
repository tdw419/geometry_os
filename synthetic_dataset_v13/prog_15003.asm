; DESCRIPTION: Renders a magenta line between points (404, 253) and (9, 225).
; PLAN: r0=404(x1), r1=253(y1), r2=9(x2), r3=225(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 253
LDI r2, 9
LDI r3, 225
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
