; DESCRIPTION: Composite: Sets a single yellow pixel at (273, 189) then Renders a cyan disk with center (432, 71) and radius 43 then Places a magenta line segment connecting (38, 181) to (504, 1).
; PLAN: r0=273(x), r1=189(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=432(x), r6=71(y), r7=43(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=38(x1), r11=181(y1), r12=504(x2), r13=1(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 273
LDI r1, 189
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 432
LDI r6, 71
LDI r7, 43
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 38
LDI r11, 181
LDI r12, 504
LDI r13, 1
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
