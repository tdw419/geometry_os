; DESCRIPTION: Places a cyan line segment connecting (252, 125) to (312, 142).
; PLAN: r0=252(x1), r1=125(y1), r2=312(x2), r3=142(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 125
LDI r2, 312
LDI r3, 142
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
