; DESCRIPTION: Draws a black line from (27, 24) to (190, 25).
; PLAN: r0=27(x1), r1=24(y1), r2=190(x2), r3=25(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 24
LDI r2, 190
LDI r3, 25
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
