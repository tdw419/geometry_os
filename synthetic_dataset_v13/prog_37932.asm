; DESCRIPTION: Composite: Draws a blue rectangle at (244, 47) with width 74 and height 59 then Draws a orange circle centered at (244, 40) with radius 34.
; PLAN: r0=244(x), r1=47(y), r2=74(width), r3=59(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=244(x), r6=40(y), r7=34(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 244
LDI r1, 47
LDI r2, 74
LDI r3, 59
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 244
LDI r6, 40
LDI r7, 34
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
