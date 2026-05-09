; DESCRIPTION: Composite: Sets a single magenta pixel at (46, 111) then Places a yellow circle of radius 71 at center (350, 100) then Places a yellow 108x111 rectangle at position (76, 56).
; PLAN: r0=46(x), r1=111(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=350(x), r6=100(y), r7=71(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=76(x), r11=56(y), r12=108(width), r13=111(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 46
LDI r1, 111
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 350
LDI r6, 100
LDI r7, 71
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 76
LDI r11, 56
LDI r12, 108
LDI r13, 111
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
