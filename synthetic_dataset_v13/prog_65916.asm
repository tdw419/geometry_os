; DESCRIPTION: Draws a red line from (19, 22) to (37, 146).
; PLAN: r0=19(x1), r1=22(y1), r2=37(x2), r3=146(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 22
LDI r2, 37
LDI r3, 146
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
