; DESCRIPTION: Composite: Renders a yellow disk with center (485, 205) and radius 16 then Places a blue dot at position (435, 243) then Creates a black rectangular region at (319, 54) spanning 25 by 107 pixels.
; PLAN: r0=485(x), r1=205(y), r2=16(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=435(x), r6=243(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=319(x), r11=54(y), r12=25(width), r13=107(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 485
LDI r1, 205
LDI r2, 16
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 435
LDI r6, 243
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 319
LDI r11, 54
LDI r12, 25
LDI r13, 107
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
