; DESCRIPTION: Draws a red line from (190, 129) to (366, 119).
; PLAN: r0=190(x1), r1=129(y1), r2=366(x2), r3=119(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 129
LDI r2, 366
LDI r3, 119
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
