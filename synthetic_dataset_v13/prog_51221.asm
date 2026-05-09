; DESCRIPTION: Composite: Places a white circle of radius 53 at center (244, 143) then Creates a purple rectangular region at (400, 149) spanning 91 by 69 pixels.
; PLAN: r0=244(x), r1=143(y), r2=53(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=400(x), r6=149(y), r7=91(width), r8=69(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 244
LDI r1, 143
LDI r2, 53
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 400
LDI r6, 149
LDI r7, 91
LDI r8, 69
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
