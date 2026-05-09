; DESCRIPTION: Draws a red line from (396, 47) to (244, 203).
; PLAN: r0=396(x1), r1=47(y1), r2=244(x2), r3=203(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 47
LDI r2, 244
LDI r3, 203
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
