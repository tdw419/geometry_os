; DESCRIPTION: Composite: Draws a green circle centered at (61, 120) with radius 36 then Sets a single black pixel at (491, 50) then Renders a purple box of size 108x103 starting at (145, 13).
; PLAN: r0=61(x), r1=120(y), r2=36(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=491(x), r6=50(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=145(x), r11=13(y), r12=108(width), r13=103(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 61
LDI r1, 120
LDI r2, 36
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 491
LDI r6, 50
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 145
LDI r11, 13
LDI r12, 108
LDI r13, 103
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
