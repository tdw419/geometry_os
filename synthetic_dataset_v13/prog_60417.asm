; DESCRIPTION: Composite: Places a red line segment connecting (152, 7) to (0, 52) then Draws a cyan circle centered at (366, 92) with radius 19 then Draws a yellow rectangle at (307, 150) with width 91 and height 77.
; PLAN: r0=152(x1), r1=7(y1), r2=0(x2), r3=52(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=366(x), r6=92(y), r7=19(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=307(x), r11=150(y), r12=91(width), r13=77(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 152
LDI r1, 7
LDI r2, 0
LDI r3, 52
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 366
LDI r6, 92
LDI r7, 19
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 307
LDI r11, 150
LDI r12, 91
LDI r13, 77
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
