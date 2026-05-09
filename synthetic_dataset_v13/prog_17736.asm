; DESCRIPTION: Draws a black line from (21, 190) to (96, 29).
; PLAN: r0=21(x1), r1=190(y1), r2=96(x2), r3=29(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 190
LDI r2, 96
LDI r3, 29
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
