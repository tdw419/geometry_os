; DESCRIPTION: Composite: Creates a cyan circular shape at (240, 127) with radius 79 then Places a blue dot at position (327, 219) then Creates a red rectangular region at (253, 126) spanning 32 by 102 pixels.
; PLAN: r0=240(x), r1=127(y), r2=79(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=327(x), r6=219(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=253(x), r11=126(y), r12=32(width), r13=102(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 240
LDI r1, 127
LDI r2, 79
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 327
LDI r6, 219
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 253
LDI r11, 126
LDI r12, 32
LDI r13, 102
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
