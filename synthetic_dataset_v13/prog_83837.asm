; DESCRIPTION: Draws a red line from (234, 91) to (170, 237).
; PLAN: r0=234(x1), r1=91(y1), r2=170(x2), r3=237(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 91
LDI r2, 170
LDI r3, 237
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
