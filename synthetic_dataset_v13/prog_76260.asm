; DESCRIPTION: Composite: Draws a purple circle centered at (129, 71) with radius 39 then Renders a cyan box of size 59x111 starting at (10, 0).
; PLAN: r0=129(x), r1=71(y), r2=39(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=10(x), r6=0(y), r7=59(width), r8=111(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 129
LDI r1, 71
LDI r2, 39
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 10
LDI r6, 0
LDI r7, 59
LDI r8, 111
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
