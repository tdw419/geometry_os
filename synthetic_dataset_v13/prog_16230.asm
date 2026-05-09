; DESCRIPTION: Composite: Places a yellow dot at position (269, 225) then Places a orange 109x31 rectangle at position (252, 77) then Renders a white disk with center (162, 150) and radius 44.
; PLAN: r0=269(x), r1=225(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=252(x), r6=77(y), r7=109(width), r8=31(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=162(x), r11=150(y), r12=44(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 269
LDI r1, 225
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 252
LDI r6, 77
LDI r7, 109
LDI r8, 31
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 162
LDI r11, 150
LDI r12, 44
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
