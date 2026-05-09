; DESCRIPTION: Composite: Creates a green circular shape at (331, 95) with radius 72 then Sets a single cyan pixel at (196, 191) then Draws a red rectangle at (335, 22) with width 107 and height 67.
; PLAN: r0=331(x), r1=95(y), r2=72(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=196(x), r6=191(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=335(x), r11=22(y), r12=107(width), r13=67(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 331
LDI r1, 95
LDI r2, 72
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 196
LDI r6, 191
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 335
LDI r11, 22
LDI r12, 107
LDI r13, 67
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
