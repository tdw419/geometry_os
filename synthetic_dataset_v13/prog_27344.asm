; DESCRIPTION: Renders a magenta line between points (281, 152) and (99, 41).
; PLAN: r0=281(x1), r1=152(y1), r2=99(x2), r3=41(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 152
LDI r2, 99
LDI r3, 41
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
