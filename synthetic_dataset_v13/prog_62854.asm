; DESCRIPTION: Composite: Places a cyan line segment connecting (56, 35) to (30, 15) then Creates a cyan circular shape at (393, 124) with radius 75 then Draws a orange rectangle at (313, 27) with width 78 and height 90.
; PLAN: r0=56(x1), r1=35(y1), r2=30(x2), r3=15(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=393(x), r6=124(y), r7=75(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=313(x), r11=27(y), r12=78(width), r13=90(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 56
LDI r1, 35
LDI r2, 30
LDI r3, 15
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 393
LDI r6, 124
LDI r7, 75
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 313
LDI r11, 27
LDI r12, 78
LDI r13, 90
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
