; DESCRIPTION: Draws a black line from (404, 53) to (245, 96).
; PLAN: r0=404(x1), r1=53(y1), r2=245(x2), r3=96(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 53
LDI r2, 245
LDI r3, 96
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
