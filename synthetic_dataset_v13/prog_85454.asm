; DESCRIPTION: Composite: Creates a blue circular shape at (77, 150) with radius 34 then Sets a single orange pixel at (245, 218) then Renders a magenta box of size 82x22 starting at (101, 149).
; PLAN: r0=77(x), r1=150(y), r2=34(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=245(x), r6=218(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=101(x), r11=149(y), r12=82(width), r13=22(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 77
LDI r1, 150
LDI r2, 34
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 245
LDI r6, 218
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 101
LDI r11, 149
LDI r12, 82
LDI r13, 22
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
