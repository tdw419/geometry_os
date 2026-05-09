; DESCRIPTION: Composite: Sets a single yellow pixel at (119, 58) then Draws a cyan line from (80, 65) to (197, 151) then Draws a white rectangle at (198, 156) with width 100 and height 78.
; PLAN: r0=119(x), r1=58(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=80(x1), r6=65(y1), r7=197(x2), r8=151(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=198(x), r11=156(y), r12=100(width), r13=78(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 119
LDI r1, 58
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 80
LDI r6, 65
LDI r7, 197
LDI r8, 151
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 198
LDI r11, 156
LDI r12, 100
LDI r13, 78
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
