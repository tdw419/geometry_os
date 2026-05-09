; DESCRIPTION: Composite: Sets a single green pixel at (14, 77) then Renders a orange box of size 90x85 starting at (78, 112) then Places a red circle of radius 77 at center (270, 144).
; PLAN: r0=14(x), r1=77(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=78(x), r6=112(y), r7=90(width), r8=85(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=270(x), r11=144(y), r12=77(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 14
LDI r1, 77
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 78
LDI r6, 112
LDI r7, 90
LDI r8, 85
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 270
LDI r11, 144
LDI r12, 77
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
