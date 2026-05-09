; DESCRIPTION: Composite: Sets a single green pixel at (165, 106) then Creates a blue circular shape at (173, 175) with radius 16 then Places a green 74x25 rectangle at position (169, 12).
; PLAN: r0=165(x), r1=106(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=173(x), r6=175(y), r7=16(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=169(x), r11=12(y), r12=74(width), r13=25(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 165
LDI r1, 106
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 173
LDI r6, 175
LDI r7, 16
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 169
LDI r11, 12
LDI r12, 74
LDI r13, 25
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
