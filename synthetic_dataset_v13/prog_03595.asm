; DESCRIPTION: Composite: Creates a cyan circular shape at (324, 161) with radius 34 then Places a magenta dot at position (345, 81) then Creates a yellow rectangular region at (248, 188) spanning 69 by 18 pixels.
; PLAN: r0=324(x), r1=161(y), r2=34(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=345(x), r6=81(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=248(x), r11=188(y), r12=69(width), r13=18(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 324
LDI r1, 161
LDI r2, 34
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 345
LDI r6, 81
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 248
LDI r11, 188
LDI r12, 69
LDI r13, 18
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
