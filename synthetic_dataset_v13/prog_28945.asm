; DESCRIPTION: Composite: Sets a single orange pixel at (452, 196) then Renders a red box of size 29x75 starting at (190, 16) then Creates a white circular shape at (433, 34) with radius 21.
; PLAN: r0=452(x), r1=196(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=190(x), r6=16(y), r7=29(width), r8=75(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=433(x), r11=34(y), r12=21(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 452
LDI r1, 196
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 190
LDI r6, 16
LDI r7, 29
LDI r8, 75
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 433
LDI r11, 34
LDI r12, 21
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
