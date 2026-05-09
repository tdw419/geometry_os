; DESCRIPTION: Composite: Sets a single cyan pixel at (361, 39) then Creates a blue circular shape at (247, 14) with radius 10 then Renders a orange box of size 49x92 starting at (381, 86).
; PLAN: r0=361(x), r1=39(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=247(x), r6=14(y), r7=10(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=381(x), r11=86(y), r12=49(width), r13=92(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 361
LDI r1, 39
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 247
LDI r6, 14
LDI r7, 10
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 381
LDI r11, 86
LDI r12, 49
LDI r13, 92
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
