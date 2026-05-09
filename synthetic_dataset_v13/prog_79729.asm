; DESCRIPTION: Composite: Renders a black box of size 39x46 starting at (456, 159) then Renders a white disk with center (145, 100) and radius 70.
; PLAN: r0=456(x), r1=159(y), r2=39(width), r3=46(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=145(x), r6=100(y), r7=70(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 456
LDI r1, 159
LDI r2, 39
LDI r3, 46
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 145
LDI r6, 100
LDI r7, 70
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
