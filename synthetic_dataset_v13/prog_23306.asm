; DESCRIPTION: Composite: Places a red dot at position (112, 254) then Places a blue circle of radius 79 at center (245, 173) then Creates a purple rectangular region at (9, 16) spanning 87 by 24 pixels.
; PLAN: r0=112(x), r1=254(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=245(x), r6=173(y), r7=79(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=9(x), r11=16(y), r12=87(width), r13=24(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 112
LDI r1, 254
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 245
LDI r6, 173
LDI r7, 79
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 9
LDI r11, 16
LDI r12, 87
LDI r13, 24
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
