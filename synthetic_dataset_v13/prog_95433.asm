; DESCRIPTION: Draws a cyan line from (147, 109) to (217, 129).
; PLAN: r0=147(x1), r1=109(y1), r2=217(x2), r3=129(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 109
LDI r2, 217
LDI r3, 129
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
