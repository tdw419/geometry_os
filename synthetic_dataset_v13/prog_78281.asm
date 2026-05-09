; DESCRIPTION: Composite: Renders a orange box of size 96x103 starting at (124, 60) then Places a black circle of radius 26 at center (312, 155).
; PLAN: r0=124(x), r1=60(y), r2=96(width), r3=103(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=312(x), r6=155(y), r7=26(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 124
LDI r1, 60
LDI r2, 96
LDI r3, 103
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 312
LDI r6, 155
LDI r7, 26
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
