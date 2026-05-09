; DESCRIPTION: Composite: Places a green circle of radius 54 at center (359, 69) then Creates a blue rectangular region at (264, 164) spanning 46 by 45 pixels.
; PLAN: r0=359(x), r1=69(y), r2=54(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=264(x), r6=164(y), r7=46(width), r8=45(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 359
LDI r1, 69
LDI r2, 54
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 264
LDI r6, 164
LDI r7, 46
LDI r8, 45
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
