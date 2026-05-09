; DESCRIPTION: Renders a red line between points (422, 20) and (393, 27).
; PLAN: r0=422(x1), r1=20(y1), r2=393(x2), r3=27(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 422
LDI r1, 20
LDI r2, 393
LDI r3, 27
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
