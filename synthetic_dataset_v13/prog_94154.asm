; DESCRIPTION: Composite: Places a black dot at position (272, 139) then Places a yellow circle of radius 80 at center (336, 118) then Renders a orange box of size 24x16 starting at (112, 31).
; PLAN: r0=272(x), r1=139(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=336(x), r6=118(y), r7=80(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=112(x), r11=31(y), r12=24(width), r13=16(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 272
LDI r1, 139
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 336
LDI r6, 118
LDI r7, 80
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 112
LDI r11, 31
LDI r12, 24
LDI r13, 16
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
