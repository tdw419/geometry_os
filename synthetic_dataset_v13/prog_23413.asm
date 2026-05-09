; DESCRIPTION: Draws a red line from (68, 121) to (482, 12).
; PLAN: r0=68(x1), r1=121(y1), r2=482(x2), r3=12(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 121
LDI r2, 482
LDI r3, 12
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
