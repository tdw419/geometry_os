; DESCRIPTION: Composite: Creates a yellow circular shape at (388, 166) with radius 78 then Renders a yellow box of size 73x73 starting at (2, 169).
; PLAN: r0=388(x), r1=166(y), r2=78(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=2(x), r6=169(y), r7=73(width), r8=73(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 388
LDI r1, 166
LDI r2, 78
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 2
LDI r6, 169
LDI r7, 73
LDI r8, 73
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
