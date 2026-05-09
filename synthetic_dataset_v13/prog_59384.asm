; DESCRIPTION: Draws a red line from (207, 147) to (398, 144).
; PLAN: r0=207(x1), r1=147(y1), r2=398(x2), r3=144(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 147
LDI r2, 398
LDI r3, 144
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
