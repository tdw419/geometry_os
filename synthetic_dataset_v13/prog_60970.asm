; DESCRIPTION: Composite: Creates a purple circular shape at (277, 138) with radius 78 then Creates a magenta rectangular region at (160, 164) spanning 41 by 49 pixels.
; PLAN: r0=277(x), r1=138(y), r2=78(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=160(x), r6=164(y), r7=41(width), r8=49(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 277
LDI r1, 138
LDI r2, 78
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 160
LDI r6, 164
LDI r7, 41
LDI r8, 49
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
