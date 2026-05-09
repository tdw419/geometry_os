; DESCRIPTION: Renders a red line between points (191, 5) and (211, 46).
; PLAN: r0=191(x1), r1=5(y1), r2=211(x2), r3=46(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 5
LDI r2, 211
LDI r3, 46
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
