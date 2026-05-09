; DESCRIPTION: Draws a black line from (500, 190) to (474, 150).
; PLAN: r0=500(x1), r1=190(y1), r2=474(x2), r3=150(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 500
LDI r1, 190
LDI r2, 474
LDI r3, 150
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
