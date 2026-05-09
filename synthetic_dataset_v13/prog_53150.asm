; DESCRIPTION: Draws a cyan line from (78, 147) to (10, 253).
; PLAN: r0=78(x1), r1=147(y1), r2=10(x2), r3=253(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 147
LDI r2, 10
LDI r3, 253
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
