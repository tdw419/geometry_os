; DESCRIPTION: Composite: Creates a orange rectangular region at (401, 99) spanning 74 by 100 pixels then Places a white circle of radius 44 at center (142, 178).
; PLAN: r0=401(x), r1=99(y), r2=74(width), r3=100(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=142(x), r6=178(y), r7=44(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 401
LDI r1, 99
LDI r2, 74
LDI r3, 100
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 142
LDI r6, 178
LDI r7, 44
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
