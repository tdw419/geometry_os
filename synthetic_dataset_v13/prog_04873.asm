; DESCRIPTION: Composite: Draws a cyan line from (53, 220) to (53, 45) then Renders a blue disk with center (449, 120) and radius 23 then Renders a purple box of size 65x88 starting at (391, 43).
; PLAN: r0=53(x1), r1=220(y1), r2=53(x2), r3=45(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=449(x), r6=120(y), r7=23(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=391(x), r11=43(y), r12=65(width), r13=88(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 53
LDI r1, 220
LDI r2, 53
LDI r3, 45
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 449
LDI r6, 120
LDI r7, 23
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 391
LDI r11, 43
LDI r12, 65
LDI r13, 88
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
