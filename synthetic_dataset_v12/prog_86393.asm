; DESCRIPTION: Renders a orange line between points (286, 164) and (190, 192).
; PLAN: r0=286(x1), r1=164(y1), r2=190(x2), r3=192(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 164
LDI r2, 190
LDI r3, 192
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
