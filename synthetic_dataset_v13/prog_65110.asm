; DESCRIPTION: Draws a red line from (350, 99) to (416, 82).
; PLAN: r0=350(x1), r1=99(y1), r2=416(x2), r3=82(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 99
LDI r2, 416
LDI r3, 82
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
