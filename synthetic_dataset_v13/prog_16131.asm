; DESCRIPTION: Composite: Creates a blue circular shape at (299, 83) with radius 52 then Renders a blue box of size 30x116 starting at (39, 67) then Sets a single orange pixel at (45, 169).
; PLAN: r0=299(x), r1=83(y), r2=52(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=39(x), r6=67(y), r7=30(width), r8=116(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=45(x), r11=169(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 299
LDI r1, 83
LDI r2, 52
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 39
LDI r6, 67
LDI r7, 30
LDI r8, 116
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 45
LDI r11, 169
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
