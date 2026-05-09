; DESCRIPTION: Composite: Places a green dot at position (504, 122) then Draws a cyan circle centered at (274, 129) with radius 49 then Renders a red box of size 105x13 starting at (366, 34).
; PLAN: r0=504(x), r1=122(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=274(x), r6=129(y), r7=49(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=366(x), r11=34(y), r12=105(width), r13=13(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 504
LDI r1, 122
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 274
LDI r6, 129
LDI r7, 49
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 366
LDI r11, 34
LDI r12, 105
LDI r13, 13
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
