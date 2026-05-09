; DESCRIPTION: Composite: Draws a red line from (27, 239) to (225, 67) then Draws a cyan rectangle at (200, 22) with width 79 and height 21 then Draws a green circle centered at (388, 130) with radius 73.
; PLAN: r0=27(x1), r1=239(y1), r2=225(x2), r3=67(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=200(x), r6=22(y), r7=79(width), r8=21(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=388(x), r11=130(y), r12=73(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 27
LDI r1, 239
LDI r2, 225
LDI r3, 67
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 200
LDI r6, 22
LDI r7, 79
LDI r8, 21
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 388
LDI r11, 130
LDI r12, 73
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
