; DESCRIPTION: Draws a red line from (486, 75) to (295, 92).
; PLAN: r0=486(x1), r1=75(y1), r2=295(x2), r3=92(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 486
LDI r1, 75
LDI r2, 295
LDI r3, 92
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
