; DESCRIPTION: Draws a magenta line from (404, 22) to (416, 187).
; PLAN: r0=404(x1), r1=22(y1), r2=416(x2), r3=187(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 22
LDI r2, 416
LDI r3, 187
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
