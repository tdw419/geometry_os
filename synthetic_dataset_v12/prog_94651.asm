; DESCRIPTION: Composite: Sets a single white pixel at (230, 242) then Places a magenta circle of radius 59 at center (328, 132) then Places a orange 62x97 rectangle at position (206, 76).
; PLAN: r0=230(x), r1=242(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=328(x), r6=132(y), r7=59(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=206(x), r11=76(y), r12=62(width), r13=97(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 230
LDI r1, 242
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 328
LDI r6, 132
LDI r7, 59
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 206
LDI r11, 76
LDI r12, 62
LDI r13, 97
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
