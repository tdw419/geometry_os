; DESCRIPTION: Renders a purple line between points (424, 113) and (487, 126).
; PLAN: r0=424(x1), r1=113(y1), r2=487(x2), r3=126(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 424
LDI r1, 113
LDI r2, 487
LDI r3, 126
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
