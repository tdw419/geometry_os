; DESCRIPTION: Composite: Draws a yellow circle centered at (248, 111) with radius 40 then Sets a single yellow pixel at (295, 219) then Renders a purple box of size 49x84 starting at (243, 57).
; PLAN: r0=248(x), r1=111(y), r2=40(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=295(x), r6=219(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=243(x), r11=57(y), r12=49(width), r13=84(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 248
LDI r1, 111
LDI r2, 40
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 295
LDI r6, 219
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 243
LDI r11, 57
LDI r12, 49
LDI r13, 84
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
