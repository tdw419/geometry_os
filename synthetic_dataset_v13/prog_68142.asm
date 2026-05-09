; DESCRIPTION: Draws a red line from (185, 54) to (450, 28).
; PLAN: r0=185(x1), r1=54(y1), r2=450(x2), r3=28(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 54
LDI r2, 450
LDI r3, 28
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
