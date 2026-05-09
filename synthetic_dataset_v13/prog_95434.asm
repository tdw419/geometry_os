; DESCRIPTION: Composite: Sets a single orange pixel at (259, 3) then Places a red circle of radius 54 at center (375, 71) then Renders a red box of size 46x59 starting at (75, 114).
; PLAN: r0=259(x), r1=3(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=375(x), r6=71(y), r7=54(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=75(x), r11=114(y), r12=46(width), r13=59(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 259
LDI r1, 3
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 375
LDI r6, 71
LDI r7, 54
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 75
LDI r11, 114
LDI r12, 46
LDI r13, 59
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
