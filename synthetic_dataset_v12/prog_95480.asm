; DESCRIPTION: Composite: Renders a blue disk with center (445, 115) and radius 51 then Places a yellow dot at position (193, 189) then Creates a yellow rectangular region at (250, 43) spanning 98 by 94 pixels.
; PLAN: r0=445(x), r1=115(y), r2=51(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=193(x), r6=189(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=250(x), r11=43(y), r12=98(width), r13=94(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 445
LDI r1, 115
LDI r2, 51
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 193
LDI r6, 189
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 250
LDI r11, 43
LDI r12, 98
LDI r13, 94
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
