; DESCRIPTION: Composite: Draws a white line from (447, 164) to (390, 238) then Draws a orange rectangle at (336, 61) with width 62 and height 65.
; PLAN: r0=447(x1), r1=164(y1), r2=390(x2), r3=238(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=336(x), r6=61(y), r7=62(width), r8=65(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 447
LDI r1, 164
LDI r2, 390
LDI r3, 238
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 336
LDI r6, 61
LDI r7, 62
LDI r8, 65
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
