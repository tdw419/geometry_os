; DESCRIPTION: Composite: Places a blue dot at position (363, 33) then Places a cyan circle of radius 67 at center (299, 169) then Places a purple 56x104 rectangle at position (11, 126).
; PLAN: r0=363(x), r1=33(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=299(x), r6=169(y), r7=67(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=11(x), r11=126(y), r12=56(width), r13=104(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 363
LDI r1, 33
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 299
LDI r6, 169
LDI r7, 67
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 11
LDI r11, 126
LDI r12, 56
LDI r13, 104
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
