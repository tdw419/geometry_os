; DESCRIPTION: Composite: Places a green dot at position (256, 94) then Renders a cyan disk with center (184, 168) and radius 55 then Draws a yellow rectangle at (341, 19) with width 59 and height 79.
; PLAN: r0=256(x), r1=94(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=184(x), r6=168(y), r7=55(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=341(x), r11=19(y), r12=59(width), r13=79(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 256
LDI r1, 94
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 184
LDI r6, 168
LDI r7, 55
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 341
LDI r11, 19
LDI r12, 59
LDI r13, 79
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
