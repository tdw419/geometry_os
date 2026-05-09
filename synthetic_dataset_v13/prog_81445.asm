; DESCRIPTION: Composite: Sets a single yellow pixel at (13, 211) then Draws a cyan circle centered at (404, 204) with radius 37 then Renders a blue box of size 13x36 starting at (402, 109).
; PLAN: r0=13(x), r1=211(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=404(x), r6=204(y), r7=37(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=402(x), r11=109(y), r12=13(width), r13=36(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 13
LDI r1, 211
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 404
LDI r6, 204
LDI r7, 37
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 402
LDI r11, 109
LDI r12, 13
LDI r13, 36
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
