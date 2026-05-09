; DESCRIPTION: Composite: Renders a yellow box of size 43x80 starting at (419, 95) then Draws a red line from (313, 147) to (354, 106).
; PLAN: r0=419(x), r1=95(y), r2=43(width), r3=80(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=313(x1), r6=147(y1), r7=354(x2), r8=106(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 419
LDI r1, 95
LDI r2, 43
LDI r3, 80
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 313
LDI r6, 147
LDI r7, 354
LDI r8, 106
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
