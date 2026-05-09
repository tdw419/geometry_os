; DESCRIPTION: Composite: Renders a yellow disk with center (382, 189) and radius 67 then Places a yellow 29x91 rectangle at position (431, 162) then Places a magenta dot at position (122, 211).
; PLAN: r0=382(x), r1=189(y), r2=67(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=431(x), r6=162(y), r7=29(width), r8=91(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=122(x), r11=211(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 382
LDI r1, 189
LDI r2, 67
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 431
LDI r6, 162
LDI r7, 29
LDI r8, 91
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 122
LDI r11, 211
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
