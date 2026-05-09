; DESCRIPTION: Draws a red line from (474, 37) to (33, 160).
; PLAN: r0=474(x1), r1=37(y1), r2=33(x2), r3=160(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 474
LDI r1, 37
LDI r2, 33
LDI r3, 160
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
