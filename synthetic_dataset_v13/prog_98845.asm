; DESCRIPTION: Draws a red line from (502, 110) to (375, 54).
; PLAN: r0=502(x1), r1=110(y1), r2=375(x2), r3=54(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 502
LDI r1, 110
LDI r2, 375
LDI r3, 54
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
