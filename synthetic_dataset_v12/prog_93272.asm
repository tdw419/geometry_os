; DESCRIPTION: Composite: Draws a yellow line from (303, 173) to (45, 3) then Draws a orange rectangle at (144, 128) with width 110 and height 26.
; PLAN: r0=303(x1), r1=173(y1), r2=45(x2), r3=3(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=144(x), r6=128(y), r7=110(width), r8=26(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 303
LDI r1, 173
LDI r2, 45
LDI r3, 3
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 144
LDI r6, 128
LDI r7, 110
LDI r8, 26
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
