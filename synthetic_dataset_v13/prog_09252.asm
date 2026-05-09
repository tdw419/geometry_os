; DESCRIPTION: Composite: Sets a single white pixel at (46, 0) then Renders a purple disk with center (256, 170) and radius 71 then Places a blue line segment connecting (215, 239) to (158, 75).
; PLAN: r0=46(x), r1=0(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=256(x), r6=170(y), r7=71(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=215(x1), r11=239(y1), r12=158(x2), r13=75(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 46
LDI r1, 0
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 256
LDI r6, 170
LDI r7, 71
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 215
LDI r11, 239
LDI r12, 158
LDI r13, 75
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
