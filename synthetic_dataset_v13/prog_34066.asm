; DESCRIPTION: Renders a purple line between points (249, 117) and (404, 166).
; PLAN: r0=249(x1), r1=117(y1), r2=404(x2), r3=166(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 117
LDI r2, 404
LDI r3, 166
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
