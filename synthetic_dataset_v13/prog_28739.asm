; DESCRIPTION: Renders a red line between points (431, 173) and (211, 19).
; PLAN: r0=431(x1), r1=173(y1), r2=211(x2), r3=19(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 431
LDI r1, 173
LDI r2, 211
LDI r3, 19
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
