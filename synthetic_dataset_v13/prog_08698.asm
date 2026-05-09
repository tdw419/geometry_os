; DESCRIPTION: Composite: Creates a black circular shape at (475, 58) with radius 26 then Renders a yellow box of size 78x59 starting at (0, 50) then Sets a single purple pixel at (356, 218).
; PLAN: r0=475(x), r1=58(y), r2=26(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=0(x), r6=50(y), r7=78(width), r8=59(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=356(x), r11=218(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 475
LDI r1, 58
LDI r2, 26
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 0
LDI r6, 50
LDI r7, 78
LDI r8, 59
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 356
LDI r11, 218
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
