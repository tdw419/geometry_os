; DESCRIPTION: Renders a red line between points (126, 208) and (424, 155).
; PLAN: r0=126(x1), r1=208(y1), r2=424(x2), r3=155(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 208
LDI r2, 424
LDI r3, 155
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
