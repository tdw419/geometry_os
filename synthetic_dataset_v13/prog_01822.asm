; DESCRIPTION: Draws a red line from (237, 19) to (430, 241).
; PLAN: r0=237(x1), r1=19(y1), r2=430(x2), r3=241(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 19
LDI r2, 430
LDI r3, 241
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
