; DESCRIPTION: Draws a red line from (285, 175) to (295, 127).
; PLAN: r0=285(x1), r1=175(y1), r2=295(x2), r3=127(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 175
LDI r2, 295
LDI r3, 127
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
