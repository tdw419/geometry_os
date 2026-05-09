; DESCRIPTION: Composite: Renders a yellow disk with center (339, 98) and radius 17 then Renders a black box of size 88x21 starting at (294, 208).
; PLAN: r0=339(x), r1=98(y), r2=17(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=294(x), r6=208(y), r7=88(width), r8=21(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 339
LDI r1, 98
LDI r2, 17
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 294
LDI r6, 208
LDI r7, 88
LDI r8, 21
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
