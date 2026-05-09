; DESCRIPTION: Composite: Sets a single magenta pixel at (269, 178) then Creates a cyan circular shape at (218, 136) with radius 79 then Places a red 12x52 rectangle at position (201, 126).
; PLAN: r0=269(x), r1=178(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=218(x), r6=136(y), r7=79(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=201(x), r11=126(y), r12=12(width), r13=52(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 269
LDI r1, 178
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 218
LDI r6, 136
LDI r7, 79
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 201
LDI r11, 126
LDI r12, 12
LDI r13, 52
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
