; DESCRIPTION: Composite: Places a magenta dot at position (466, 29) then Draws a cyan circle centered at (420, 64) with radius 63 then Creates a yellow rectangular region at (113, 19) spanning 45 by 120 pixels.
; PLAN: r0=466(x), r1=29(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=420(x), r6=64(y), r7=63(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=113(x), r11=19(y), r12=45(width), r13=120(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 466
LDI r1, 29
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 420
LDI r6, 64
LDI r7, 63
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 113
LDI r11, 19
LDI r12, 45
LDI r13, 120
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
