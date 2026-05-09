; DESCRIPTION: Renders a white line between points (127, 201) and (404, 191).
; PLAN: r0=127(x1), r1=201(y1), r2=404(x2), r3=191(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 201
LDI r2, 404
LDI r3, 191
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
