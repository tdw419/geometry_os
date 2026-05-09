; DESCRIPTION: Composite: Draws a black circle centered at (353, 101) with radius 71 then Places a green dot at position (384, 177) then Places a cyan 88x14 rectangle at position (273, 57).
; PLAN: r0=353(x), r1=101(y), r2=71(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=384(x), r6=177(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=273(x), r11=57(y), r12=88(width), r13=14(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 353
LDI r1, 101
LDI r2, 71
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 384
LDI r6, 177
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 273
LDI r11, 57
LDI r12, 88
LDI r13, 14
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
