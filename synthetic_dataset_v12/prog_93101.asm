; DESCRIPTION: Draws a red line from (251, 59) to (295, 13).
; PLAN: r0=251(x1), r1=59(y1), r2=295(x2), r3=13(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 59
LDI r2, 295
LDI r3, 13
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
