; DESCRIPTION: Draws a red line from (374, 35) to (120, 54).
; PLAN: r0=374(x1), r1=35(y1), r2=120(x2), r3=54(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 35
LDI r2, 120
LDI r3, 54
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
