; DESCRIPTION: Renders a yellow line between points (457, 79) and (295, 76).
; PLAN: r0=457(x1), r1=79(y1), r2=295(x2), r3=76(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 457
LDI r1, 79
LDI r2, 295
LDI r3, 76
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
