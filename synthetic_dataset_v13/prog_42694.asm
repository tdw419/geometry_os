; DESCRIPTION: Composite: Draws a cyan rectangle at (371, 24) with width 41 and height 32 then Renders a yellow disk with center (141, 59) and radius 58 then Places a magenta dot at position (354, 66).
; PLAN: r0=371(x), r1=24(y), r2=41(width), r3=32(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=141(x), r6=59(y), r7=58(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=354(x), r11=66(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 371
LDI r1, 24
LDI r2, 41
LDI r3, 32
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 141
LDI r6, 59
LDI r7, 58
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 354
LDI r11, 66
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
