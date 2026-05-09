; DESCRIPTION: Composite: Renders a yellow disk with center (63, 66) and radius 17 then Draws a cyan rectangle at (9, 160) with width 20 and height 12 then Sets a single magenta pixel at (479, 207).
; PLAN: r0=63(x), r1=66(y), r2=17(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=9(x), r6=160(y), r7=20(width), r8=12(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=479(x), r11=207(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 63
LDI r1, 66
LDI r2, 17
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 9
LDI r6, 160
LDI r7, 20
LDI r8, 12
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 479
LDI r11, 207
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
