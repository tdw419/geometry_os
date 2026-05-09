; DESCRIPTION: Draws a yellow line from (71, 14) to (191, 162).
; PLAN: r0=71(x1), r1=14(y1), r2=191(x2), r3=162(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 14
LDI r2, 191
LDI r3, 162
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
