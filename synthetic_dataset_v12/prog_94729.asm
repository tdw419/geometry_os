; DESCRIPTION: Composite: Places a purple 120x46 rectangle at position (191, 96) then Sets a single purple pixel at (350, 133) then Creates a black circular shape at (326, 111) with radius 47.
; PLAN: r0=191(x), r1=96(y), r2=120(width), r3=46(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=350(x), r6=133(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=326(x), r11=111(y), r12=47(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 191
LDI r1, 96
LDI r2, 120
LDI r3, 46
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 350
LDI r6, 133
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 326
LDI r11, 111
LDI r12, 47
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
