; DESCRIPTION: Composite: Renders a orange line between points (454, 205) and (102, 158) then Places a white 87x44 rectangle at position (247, 129) then Creates a white circular shape at (173, 93) with radius 18.
; PLAN: r0=454(x1), r1=205(y1), r2=102(x2), r3=158(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=247(x), r6=129(y), r7=87(width), r8=44(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=173(x), r11=93(y), r12=18(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 454
LDI r1, 205
LDI r2, 102
LDI r3, 158
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 247
LDI r6, 129
LDI r7, 87
LDI r8, 44
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 173
LDI r11, 93
LDI r12, 18
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
