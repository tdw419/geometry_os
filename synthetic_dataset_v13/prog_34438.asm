; DESCRIPTION: Renders a red line between points (205, 36) and (218, 234).
; PLAN: r0=205(x1), r1=36(y1), r2=218(x2), r3=234(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 36
LDI r2, 218
LDI r3, 234
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
