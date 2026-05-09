; DESCRIPTION: Composite: Renders a purple box of size 71x70 starting at (32, 177) then Renders a black disk with center (374, 106) and radius 72 then Places a white line segment connecting (55, 91) to (73, 252).
; PLAN: r0=32(x), r1=177(y), r2=71(width), r3=70(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=374(x), r6=106(y), r7=72(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=55(x1), r11=91(y1), r12=73(x2), r13=252(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 32
LDI r1, 177
LDI r2, 71
LDI r3, 70
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 374
LDI r6, 106
LDI r7, 72
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 55
LDI r11, 91
LDI r12, 73
LDI r13, 252
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
