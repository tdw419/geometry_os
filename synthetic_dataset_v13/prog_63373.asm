; DESCRIPTION: Composite: Renders a purple box of size 21x61 starting at (396, 20) then Places a orange dot at position (221, 210) then Renders a magenta disk with center (384, 68) and radius 33.
; PLAN: r0=396(x), r1=20(y), r2=21(width), r3=61(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=221(x), r6=210(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=384(x), r11=68(y), r12=33(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 396
LDI r1, 20
LDI r2, 21
LDI r3, 61
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 221
LDI r6, 210
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 384
LDI r11, 68
LDI r12, 33
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
