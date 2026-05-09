; DESCRIPTION: Renders a yellow line between points (329, 104) and (395, 249).
; PLAN: r0=329(x1), r1=104(y1), r2=395(x2), r3=249(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 104
LDI r2, 395
LDI r3, 249
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
