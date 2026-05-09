; DESCRIPTION: Composite: Draws a magenta rectangle at (131, 40) with width 45 and height 108 then Places a cyan dot at position (242, 160) then Places a yellow circle of radius 71 at center (378, 163).
; PLAN: r0=131(x), r1=40(y), r2=45(width), r3=108(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=242(x), r6=160(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=378(x), r11=163(y), r12=71(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 131
LDI r1, 40
LDI r2, 45
LDI r3, 108
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 242
LDI r6, 160
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 378
LDI r11, 163
LDI r12, 71
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
