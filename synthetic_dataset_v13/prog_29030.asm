; DESCRIPTION: Composite: Places a green 105x50 rectangle at position (330, 105) then Places a blue dot at position (422, 108) then Creates a red circular shape at (176, 200) with radius 33.
; PLAN: r0=330(x), r1=105(y), r2=105(width), r3=50(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=422(x), r6=108(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=176(x), r11=200(y), r12=33(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 330
LDI r1, 105
LDI r2, 105
LDI r3, 50
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 422
LDI r6, 108
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 176
LDI r11, 200
LDI r12, 33
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
