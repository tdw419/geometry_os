; DESCRIPTION: Composite: Places a white circle of radius 45 at center (63, 187) then Sets a single black pixel at (371, 249) then Renders a purple box of size 40x39 starting at (48, 98).
; PLAN: r0=63(x), r1=187(y), r2=45(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=371(x), r6=249(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=48(x), r11=98(y), r12=40(width), r13=39(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 63
LDI r1, 187
LDI r2, 45
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 371
LDI r6, 249
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 48
LDI r11, 98
LDI r12, 40
LDI r13, 39
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
