; DESCRIPTION: Composite: Sets a single purple pixel at (108, 80) then Renders a red box of size 34x20 starting at (154, 129) then Draws a blue circle centered at (400, 40) with radius 37.
; PLAN: r0=108(x), r1=80(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=154(x), r6=129(y), r7=34(width), r8=20(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=400(x), r11=40(y), r12=37(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 108
LDI r1, 80
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 154
LDI r6, 129
LDI r7, 34
LDI r8, 20
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 400
LDI r11, 40
LDI r12, 37
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
