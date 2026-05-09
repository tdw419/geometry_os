; DESCRIPTION: Composite: Renders a red box of size 25x32 starting at (14, 58) then Places a white dot at position (199, 254) then Creates a white circular shape at (137, 186) with radius 64.
; PLAN: r0=14(x), r1=58(y), r2=25(width), r3=32(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=199(x), r6=254(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=137(x), r11=186(y), r12=64(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 14
LDI r1, 58
LDI r2, 25
LDI r3, 32
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 199
LDI r6, 254
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 137
LDI r11, 186
LDI r12, 64
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
