; DESCRIPTION: Composite: Renders a blue disk with center (431, 109) and radius 60 then Places a purple dot at position (438, 204) then Places a blue 109x51 rectangle at position (275, 127).
; PLAN: r0=431(x), r1=109(y), r2=60(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=438(x), r6=204(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=275(x), r11=127(y), r12=109(width), r13=51(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 431
LDI r1, 109
LDI r2, 60
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 438
LDI r6, 204
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 275
LDI r11, 127
LDI r12, 109
LDI r13, 51
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
