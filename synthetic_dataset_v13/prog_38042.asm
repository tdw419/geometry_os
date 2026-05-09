; DESCRIPTION: Composite: Places a yellow 98x88 rectangle at position (139, 92) then Renders a orange disk with center (185, 112) and radius 30 then Places a green dot at position (339, 207).
; PLAN: r0=139(x), r1=92(y), r2=98(width), r3=88(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=185(x), r6=112(y), r7=30(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=339(x), r11=207(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 139
LDI r1, 92
LDI r2, 98
LDI r3, 88
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 185
LDI r6, 112
LDI r7, 30
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 339
LDI r11, 207
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
