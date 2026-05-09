; DESCRIPTION: Composite: Draws a red circle centered at (187, 172) with radius 80 then Renders a cyan box of size 25x110 starting at (280, 47) then Places a orange line segment connecting (453, 95) to (229, 39).
; PLAN: r0=187(x), r1=172(y), r2=80(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=280(x), r6=47(y), r7=25(width), r8=110(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=453(x1), r11=95(y1), r12=229(x2), r13=39(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 187
LDI r1, 172
LDI r2, 80
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 280
LDI r6, 47
LDI r7, 25
LDI r8, 110
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 453
LDI r11, 95
LDI r12, 229
LDI r13, 39
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
