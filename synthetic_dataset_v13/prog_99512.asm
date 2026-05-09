; DESCRIPTION: Composite: Sets a single red pixel at (509, 102) then Renders a orange disk with center (281, 133) and radius 56 then Creates a yellow rectangular region at (106, 22) spanning 100 by 81 pixels.
; PLAN: r0=509(x), r1=102(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=281(x), r6=133(y), r7=56(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=106(x), r11=22(y), r12=100(width), r13=81(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 509
LDI r1, 102
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 281
LDI r6, 133
LDI r7, 56
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 106
LDI r11, 22
LDI r12, 100
LDI r13, 81
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
