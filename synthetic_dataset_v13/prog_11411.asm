; DESCRIPTION: Draws a black line from (281, 183) to (190, 109).
; PLAN: r0=281(x1), r1=183(y1), r2=190(x2), r3=109(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 183
LDI r2, 190
LDI r3, 109
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
