; DESCRIPTION: Composite: Sets a single red pixel at (371, 255) then Renders a yellow disk with center (404, 195) and radius 18 then Draws a orange rectangle at (186, 216) with width 20 and height 23.
; PLAN: r0=371(x), r1=255(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=404(x), r6=195(y), r7=18(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=186(x), r11=216(y), r12=20(width), r13=23(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 371
LDI r1, 255
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 404
LDI r6, 195
LDI r7, 18
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 186
LDI r11, 216
LDI r12, 20
LDI r13, 23
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
