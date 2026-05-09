; DESCRIPTION: Renders a red line between points (393, 103) and (347, 141).
; PLAN: r0=393(x1), r1=103(y1), r2=347(x2), r3=141(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 103
LDI r2, 347
LDI r3, 141
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
