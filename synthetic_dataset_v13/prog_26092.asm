; DESCRIPTION: Draws a yellow line from (77, 120) to (85, 20).
; PLAN: r0=77(x1), r1=120(y1), r2=85(x2), r3=20(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 120
LDI r2, 85
LDI r3, 20
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
