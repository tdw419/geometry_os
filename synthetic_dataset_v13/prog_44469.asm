; DESCRIPTION: Composite: Renders a orange box of size 12x110 starting at (320, 122) then Draws a yellow line from (278, 121) to (244, 130).
; PLAN: r0=320(x), r1=122(y), r2=12(width), r3=110(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=278(x1), r6=121(y1), r7=244(x2), r8=130(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 320
LDI r1, 122
LDI r2, 12
LDI r3, 110
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 278
LDI r6, 121
LDI r7, 244
LDI r8, 130
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
