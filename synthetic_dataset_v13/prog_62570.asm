; DESCRIPTION: Draws a red line from (439, 162) to (340, 71).
; PLAN: r0=439(x1), r1=162(y1), r2=340(x2), r3=71(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 439
LDI r1, 162
LDI r2, 340
LDI r3, 71
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
