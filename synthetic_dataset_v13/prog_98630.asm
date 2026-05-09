; DESCRIPTION: Composite: Renders a orange box of size 92x36 starting at (190, 186) then Draws a yellow circle centered at (175, 130) with radius 55.
; PLAN: r0=190(x), r1=186(y), r2=92(width), r3=36(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=175(x), r6=130(y), r7=55(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 190
LDI r1, 186
LDI r2, 92
LDI r3, 36
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 175
LDI r6, 130
LDI r7, 55
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
