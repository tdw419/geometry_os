; DESCRIPTION: Composite: Sets a single white pixel at (38, 103) then Renders a green disk with center (322, 159) and radius 72 then Creates a green rectangular region at (252, 109) spanning 61 by 120 pixels.
; PLAN: r0=38(x), r1=103(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=322(x), r6=159(y), r7=72(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=252(x), r11=109(y), r12=61(width), r13=120(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 38
LDI r1, 103
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 322
LDI r6, 159
LDI r7, 72
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 252
LDI r11, 109
LDI r12, 61
LDI r13, 120
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
