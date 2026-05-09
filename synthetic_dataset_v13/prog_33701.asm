; DESCRIPTION: Composite: Places a yellow circle of radius 46 at center (46, 82) then Places a orange dot at position (136, 186) then Renders a black box of size 58x10 starting at (263, 196).
; PLAN: r0=46(x), r1=82(y), r2=46(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=136(x), r6=186(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=263(x), r11=196(y), r12=58(width), r13=10(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 46
LDI r1, 82
LDI r2, 46
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 136
LDI r6, 186
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 263
LDI r11, 196
LDI r12, 58
LDI r13, 10
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
