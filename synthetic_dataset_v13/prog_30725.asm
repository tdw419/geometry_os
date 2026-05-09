; DESCRIPTION: Composite: Renders a green disk with center (160, 33) and radius 21 then Renders a yellow box of size 24x102 starting at (233, 139).
; PLAN: r0=160(x), r1=33(y), r2=21(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=233(x), r6=139(y), r7=24(width), r8=102(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 160
LDI r1, 33
LDI r2, 21
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 233
LDI r6, 139
LDI r7, 24
LDI r8, 102
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
