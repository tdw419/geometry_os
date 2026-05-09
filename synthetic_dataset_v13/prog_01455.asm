; DESCRIPTION: Renders a red line between points (55, 98) and (392, 248).
; PLAN: r0=55(x1), r1=98(y1), r2=392(x2), r3=248(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 98
LDI r2, 392
LDI r3, 248
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
