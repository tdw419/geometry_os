; DESCRIPTION: Draws a black line from (404, 20) to (291, 52).
; PLAN: r0=404(x1), r1=20(y1), r2=291(x2), r3=52(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 20
LDI r2, 291
LDI r3, 52
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
