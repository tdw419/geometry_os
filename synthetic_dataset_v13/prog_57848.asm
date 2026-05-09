; DESCRIPTION: Composite: Renders a yellow box of size 39x73 starting at (105, 128) then Draws a red circle centered at (200, 35) with radius 10.
; PLAN: r0=105(x), r1=128(y), r2=39(width), r3=73(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=200(x), r6=35(y), r7=10(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 105
LDI r1, 128
LDI r2, 39
LDI r3, 73
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 200
LDI r6, 35
LDI r7, 10
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
