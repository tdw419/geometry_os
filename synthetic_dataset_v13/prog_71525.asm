; DESCRIPTION: Composite: Places a green dot at position (506, 254) then Creates a orange circular shape at (157, 149) with radius 44 then Places a green 105x59 rectangle at position (187, 9).
; PLAN: r0=506(x), r1=254(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=157(x), r6=149(y), r7=44(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=187(x), r11=9(y), r12=105(width), r13=59(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 506
LDI r1, 254
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 157
LDI r6, 149
LDI r7, 44
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 187
LDI r11, 9
LDI r12, 105
LDI r13, 59
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
