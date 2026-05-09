; DESCRIPTION: Composite: Renders a yellow box of size 46x98 starting at (18, 117) then Draws a black circle centered at (131, 108) with radius 38.
; PLAN: r0=18(x), r1=117(y), r2=46(width), r3=98(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=131(x), r6=108(y), r7=38(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 18
LDI r1, 117
LDI r2, 46
LDI r3, 98
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 131
LDI r6, 108
LDI r7, 38
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
