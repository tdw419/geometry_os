; DESCRIPTION: Composite: Renders a white disk with center (258, 146) and radius 31 then Sets a single white pixel at (270, 116) then Renders a orange box of size 44x117 starting at (252, 30).
; PLAN: r0=258(x), r1=146(y), r2=31(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=270(x), r6=116(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=252(x), r11=30(y), r12=44(width), r13=117(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 258
LDI r1, 146
LDI r2, 31
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 270
LDI r6, 116
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 252
LDI r11, 30
LDI r12, 44
LDI r13, 117
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
