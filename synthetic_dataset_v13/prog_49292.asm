; DESCRIPTION: Composite: Sets a single red pixel at (474, 78) then Renders a cyan box of size 43x97 starting at (269, 33) then Places a green circle of radius 30 at center (172, 96).
; PLAN: r0=474(x), r1=78(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=269(x), r6=33(y), r7=43(width), r8=97(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=172(x), r11=96(y), r12=30(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 474
LDI r1, 78
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 269
LDI r6, 33
LDI r7, 43
LDI r8, 97
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 172
LDI r11, 96
LDI r12, 30
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
