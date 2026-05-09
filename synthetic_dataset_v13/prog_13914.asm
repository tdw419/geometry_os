; DESCRIPTION: Composite: Draws a yellow circle centered at (65, 220) with radius 20 then Sets a single white pixel at (434, 24) then Places a white line segment connecting (481, 37) to (391, 195).
; PLAN: r0=65(x), r1=220(y), r2=20(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=434(x), r6=24(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=481(x1), r11=37(y1), r12=391(x2), r13=195(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 65
LDI r1, 220
LDI r2, 20
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 434
LDI r6, 24
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 481
LDI r11, 37
LDI r12, 391
LDI r13, 195
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
