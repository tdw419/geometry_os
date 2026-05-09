; DESCRIPTION: Composite: Renders a magenta disk with center (219, 110) and radius 60 then Sets a single cyan pixel at (455, 182) then Renders a orange line between points (215, 142) and (403, 123).
; PLAN: r0=219(x), r1=110(y), r2=60(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=455(x), r6=182(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=215(x1), r11=142(y1), r12=403(x2), r13=123(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 219
LDI r1, 110
LDI r2, 60
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 455
LDI r6, 182
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 215
LDI r11, 142
LDI r12, 403
LDI r13, 123
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
