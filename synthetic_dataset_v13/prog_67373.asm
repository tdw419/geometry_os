; DESCRIPTION: Renders a magenta line between points (288, 172) and (404, 113).
; PLAN: r0=288(x1), r1=172(y1), r2=404(x2), r3=113(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 172
LDI r2, 404
LDI r3, 113
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
