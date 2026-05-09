; DESCRIPTION: Draws a red line from (71, 191) to (78, 127).
; PLAN: r0=71(x1), r1=191(y1), r2=78(x2), r3=127(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 191
LDI r2, 78
LDI r3, 127
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
