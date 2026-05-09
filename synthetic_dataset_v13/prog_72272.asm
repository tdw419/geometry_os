; DESCRIPTION: Composite: Creates a green circular shape at (386, 106) with radius 44 then Places a white dot at position (369, 228) then Creates a orange rectangular region at (259, 169) spanning 76 by 57 pixels.
; PLAN: r0=386(x), r1=106(y), r2=44(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=369(x), r6=228(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=259(x), r11=169(y), r12=76(width), r13=57(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 386
LDI r1, 106
LDI r2, 44
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 369
LDI r6, 228
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 259
LDI r11, 169
LDI r12, 76
LDI r13, 57
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
