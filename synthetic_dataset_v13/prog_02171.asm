; DESCRIPTION: Renders a red line between points (152, 11) and (231, 160).
; PLAN: r0=152(x1), r1=11(y1), r2=231(x2), r3=160(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 11
LDI r2, 231
LDI r3, 160
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
