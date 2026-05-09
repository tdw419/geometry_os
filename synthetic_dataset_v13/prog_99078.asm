; DESCRIPTION: Renders a purple line between points (464, 213) and (31, 246).
; PLAN: r0=464(x1), r1=213(y1), r2=31(x2), r3=246(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 464
LDI r1, 213
LDI r2, 31
LDI r3, 246
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
