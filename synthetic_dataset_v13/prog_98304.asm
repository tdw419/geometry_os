; DESCRIPTION: Composite: Places a orange dot at position (172, 1) then Places a green circle of radius 72 at center (290, 124) then Places a magenta 31x30 rectangle at position (431, 0).
; PLAN: r0=172(x), r1=1(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=290(x), r6=124(y), r7=72(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=431(x), r11=0(y), r12=31(width), r13=30(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 172
LDI r1, 1
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 290
LDI r6, 124
LDI r7, 72
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 431
LDI r11, 0
LDI r12, 31
LDI r13, 30
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
