; DESCRIPTION: Composite: Draws a black circle centered at (78, 216) with radius 32 then Sets a single cyan pixel at (162, 243) then Places a blue 85x25 rectangle at position (314, 132).
; PLAN: r0=78(x), r1=216(y), r2=32(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=162(x), r6=243(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=314(x), r11=132(y), r12=85(width), r13=25(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 78
LDI r1, 216
LDI r2, 32
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 162
LDI r6, 243
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 314
LDI r11, 132
LDI r12, 85
LDI r13, 25
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
