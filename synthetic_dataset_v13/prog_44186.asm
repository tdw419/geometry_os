; DESCRIPTION: Composite: Renders a orange box of size 44x90 starting at (360, 127) then Renders a white line between points (312, 221) and (3, 38) then Draws a cyan circle centered at (147, 75) with radius 71.
; PLAN: r0=360(x), r1=127(y), r2=44(width), r3=90(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=312(x1), r6=221(y1), r7=3(x2), r8=38(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=147(x), r11=75(y), r12=71(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 360
LDI r1, 127
LDI r2, 44
LDI r3, 90
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 312
LDI r6, 221
LDI r7, 3
LDI r8, 38
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 147
LDI r11, 75
LDI r12, 71
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
