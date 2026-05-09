; DESCRIPTION: Draws a red line from (447, 71) to (290, 20).
; PLAN: r0=447(x1), r1=71(y1), r2=290(x2), r3=20(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 447
LDI r1, 71
LDI r2, 290
LDI r3, 20
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
