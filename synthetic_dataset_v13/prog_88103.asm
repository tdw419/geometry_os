; DESCRIPTION: Composite: Sets a single blue pixel at (197, 151) then Renders a black box of size 99x38 starting at (173, 58) then Renders a green disk with center (71, 139) and radius 46.
; PLAN: r0=197(x), r1=151(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=173(x), r6=58(y), r7=99(width), r8=38(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=71(x), r11=139(y), r12=46(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 197
LDI r1, 151
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 173
LDI r6, 58
LDI r7, 99
LDI r8, 38
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 71
LDI r11, 139
LDI r12, 46
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
