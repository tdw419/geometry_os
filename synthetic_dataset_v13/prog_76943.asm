; DESCRIPTION: Composite: Renders a blue disk with center (251, 164) and radius 25 then Places a yellow dot at position (58, 193) then Renders a purple box of size 74x56 starting at (389, 30).
; PLAN: r0=251(x), r1=164(y), r2=25(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=58(x), r6=193(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=389(x), r11=30(y), r12=74(width), r13=56(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 251
LDI r1, 164
LDI r2, 25
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 58
LDI r6, 193
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 389
LDI r11, 30
LDI r12, 74
LDI r13, 56
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
