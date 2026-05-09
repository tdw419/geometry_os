; DESCRIPTION: Composite: Renders a orange box of size 113x43 starting at (271, 142) then Creates a yellow circular shape at (423, 61) with radius 48.
; PLAN: r0=271(x), r1=142(y), r2=113(width), r3=43(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=423(x), r6=61(y), r7=48(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 271
LDI r1, 142
LDI r2, 113
LDI r3, 43
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 423
LDI r6, 61
LDI r7, 48
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
