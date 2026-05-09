; DESCRIPTION: Composite: Renders a cyan disk with center (138, 111) and radius 41 then Draws a orange line from (199, 21) to (21, 151) then Creates a blue rectangular region at (482, 97) spanning 20 by 95 pixels.
; PLAN: r0=138(x), r1=111(y), r2=41(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=199(x1), r6=21(y1), r7=21(x2), r8=151(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=482(x), r11=97(y), r12=20(width), r13=95(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 138
LDI r1, 111
LDI r2, 41
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 199
LDI r6, 21
LDI r7, 21
LDI r8, 151
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 482
LDI r11, 97
LDI r12, 20
LDI r13, 95
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
