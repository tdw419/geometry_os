; DESCRIPTION: Draws a red line from (367, 133) to (295, 52).
; PLAN: r0=367(x1), r1=133(y1), r2=295(x2), r3=52(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 133
LDI r2, 295
LDI r3, 52
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
