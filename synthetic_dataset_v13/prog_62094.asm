; DESCRIPTION: Composite: Renders a yellow box of size 62x16 starting at (401, 112) then Renders a yellow disk with center (309, 91) and radius 16 then Places a red line segment connecting (394, 154) to (432, 250).
; PLAN: r0=401(x), r1=112(y), r2=62(width), r3=16(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=309(x), r6=91(y), r7=16(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=394(x1), r11=154(y1), r12=432(x2), r13=250(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 401
LDI r1, 112
LDI r2, 62
LDI r3, 16
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 309
LDI r6, 91
LDI r7, 16
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 394
LDI r11, 154
LDI r12, 432
LDI r13, 250
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
