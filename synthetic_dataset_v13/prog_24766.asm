; DESCRIPTION: Draws a red line from (363, 205) to (416, 63).
; PLAN: r0=363(x1), r1=205(y1), r2=416(x2), r3=63(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 205
LDI r2, 416
LDI r3, 63
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
