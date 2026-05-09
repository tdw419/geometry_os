; DESCRIPTION: Composite: Places a green dot at position (479, 151) then Renders a yellow disk with center (165, 125) and radius 78 then Renders a blue box of size 94x55 starting at (2, 32).
; PLAN: r0=479(x), r1=151(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=165(x), r6=125(y), r7=78(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=2(x), r11=32(y), r12=94(width), r13=55(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 479
LDI r1, 151
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 165
LDI r6, 125
LDI r7, 78
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 2
LDI r11, 32
LDI r12, 94
LDI r13, 55
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
