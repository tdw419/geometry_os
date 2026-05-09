; DESCRIPTION: Renders a purple line between points (502, 178) and (348, 68).
; PLAN: r0=502(x1), r1=178(y1), r2=348(x2), r3=68(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 502
LDI r1, 178
LDI r2, 348
LDI r3, 68
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
