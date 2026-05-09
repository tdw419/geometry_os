; DESCRIPTION: Places a yellow line segment connecting (195, 152) to (273, 41).
; PLAN: r0=195(x1), r1=152(y1), r2=273(x2), r3=41(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 152
LDI r2, 273
LDI r3, 41
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
