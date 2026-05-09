; DESCRIPTION: Composite: Renders a yellow box of size 23x102 starting at (341, 86) then Places a red circle of radius 39 at center (85, 91).
; PLAN: r0=341(x), r1=86(y), r2=23(width), r3=102(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=85(x), r6=91(y), r7=39(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 341
LDI r1, 86
LDI r2, 23
LDI r3, 102
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 85
LDI r6, 91
LDI r7, 39
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
