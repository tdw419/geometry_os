; DESCRIPTION: Composite: Places a white circle of radius 27 at center (154, 193) then Creates a yellow rectangular region at (246, 43) spanning 69 by 34 pixels.
; PLAN: r0=154(x), r1=193(y), r2=27(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=246(x), r6=43(y), r7=69(width), r8=34(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 154
LDI r1, 193
LDI r2, 27
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 246
LDI r6, 43
LDI r7, 69
LDI r8, 34
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
