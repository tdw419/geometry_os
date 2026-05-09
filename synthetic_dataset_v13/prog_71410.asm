; DESCRIPTION: Draws a yellow line from (308, 165) to (407, 193).
; PLAN: r0=308(x1), r1=165(y1), r2=407(x2), r3=193(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 165
LDI r2, 407
LDI r3, 193
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
