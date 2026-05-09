; DESCRIPTION: Composite: Creates a cyan circular shape at (147, 179) with radius 48 then Places a yellow dot at position (241, 162) then Renders a orange box of size 34x110 starting at (132, 71).
; PLAN: r0=147(x), r1=179(y), r2=48(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=241(x), r6=162(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=132(x), r11=71(y), r12=34(width), r13=110(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 147
LDI r1, 179
LDI r2, 48
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 241
LDI r6, 162
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 132
LDI r11, 71
LDI r12, 34
LDI r13, 110
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
