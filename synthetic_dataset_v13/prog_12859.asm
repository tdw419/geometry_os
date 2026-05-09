; DESCRIPTION: Places a yellow line segment connecting (461, 52) to (248, 182).
; PLAN: r0=461(x1), r1=52(y1), r2=248(x2), r3=182(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 461
LDI r1, 52
LDI r2, 248
LDI r3, 182
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
