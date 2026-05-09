; DESCRIPTION: Renders a yellow line between points (173, 216) and (152, 41).
; PLAN: r0=173(x1), r1=216(y1), r2=152(x2), r3=41(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 216
LDI r2, 152
LDI r3, 41
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
