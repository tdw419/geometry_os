; DESCRIPTION: Draws a black line from (214, 188) to (424, 45).
; PLAN: r0=214(x1), r1=188(y1), r2=424(x2), r3=45(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 188
LDI r2, 424
LDI r3, 45
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
