; DESCRIPTION: Composite: Draws a white circle centered at (269, 206) with radius 35 then Renders a red box of size 22x15 starting at (69, 160).
; PLAN: r0=269(x), r1=206(y), r2=35(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=69(x), r6=160(y), r7=22(width), r8=15(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 269
LDI r1, 206
LDI r2, 35
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 69
LDI r6, 160
LDI r7, 22
LDI r8, 15
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
