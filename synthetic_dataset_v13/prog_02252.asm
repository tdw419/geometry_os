; DESCRIPTION: Composite: Draws a red line from (510, 250) to (344, 235) then Renders a yellow box of size 102x105 starting at (342, 37).
; PLAN: r0=510(x1), r1=250(y1), r2=344(x2), r3=235(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=342(x), r6=37(y), r7=102(width), r8=105(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 510
LDI r1, 250
LDI r2, 344
LDI r3, 235
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 342
LDI r6, 37
LDI r7, 102
LDI r8, 105
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
