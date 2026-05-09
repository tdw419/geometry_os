; DESCRIPTION: Draws a green line from (120, 129) to (190, 4).
; PLAN: r0=120(x1), r1=129(y1), r2=190(x2), r3=4(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 129
LDI r2, 190
LDI r3, 4
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
