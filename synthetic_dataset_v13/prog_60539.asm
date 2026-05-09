; DESCRIPTION: Composite: Places a red 33x52 rectangle at position (358, 166) then Sets a single green pixel at (401, 71) then Creates a purple circular shape at (269, 153) with radius 46.
; PLAN: r0=358(x), r1=166(y), r2=33(width), r3=52(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=401(x), r6=71(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=269(x), r11=153(y), r12=46(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 358
LDI r1, 166
LDI r2, 33
LDI r3, 52
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 401
LDI r6, 71
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 269
LDI r11, 153
LDI r12, 46
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
