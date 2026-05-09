; DESCRIPTION: Composite: Places a orange 17x40 rectangle at position (129, 16) then Renders a blue disk with center (63, 108) and radius 36.
; PLAN: r0=129(x), r1=16(y), r2=17(width), r3=40(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=63(x), r6=108(y), r7=36(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 129
LDI r1, 16
LDI r2, 17
LDI r3, 40
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 63
LDI r6, 108
LDI r7, 36
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
