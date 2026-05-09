; DESCRIPTION: Composite: Renders a yellow box of size 11x65 starting at (2, 166) then Places a black circle of radius 10 at center (117, 160).
; PLAN: r0=2(x), r1=166(y), r2=11(width), r3=65(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=117(x), r6=160(y), r7=10(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 2
LDI r1, 166
LDI r2, 11
LDI r3, 65
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 117
LDI r6, 160
LDI r7, 10
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
