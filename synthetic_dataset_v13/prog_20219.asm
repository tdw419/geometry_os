; DESCRIPTION: Draws a red line from (419, 231) to (253, 113).
; PLAN: r0=419(x1), r1=231(y1), r2=253(x2), r3=113(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 419
LDI r1, 231
LDI r2, 253
LDI r3, 113
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
