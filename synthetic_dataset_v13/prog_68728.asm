; DESCRIPTION: Composite: Renders a orange box of size 83x76 starting at (377, 34) then Places a yellow circle of radius 34 at center (353, 66).
; PLAN: r0=377(x), r1=34(y), r2=83(width), r3=76(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=353(x), r6=66(y), r7=34(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 377
LDI r1, 34
LDI r2, 83
LDI r3, 76
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 353
LDI r6, 66
LDI r7, 34
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
