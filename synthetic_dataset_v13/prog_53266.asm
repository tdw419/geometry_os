; DESCRIPTION: Composite: Creates a red circular shape at (287, 161) with radius 40 then Creates a blue rectangular region at (188, 161) spanning 70 by 76 pixels.
; PLAN: r0=287(x), r1=161(y), r2=40(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=188(x), r6=161(y), r7=70(width), r8=76(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 287
LDI r1, 161
LDI r2, 40
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 188
LDI r6, 161
LDI r7, 70
LDI r8, 76
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
