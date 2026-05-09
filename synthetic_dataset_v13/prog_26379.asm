; DESCRIPTION: Composite: Draws a purple circle centered at (177, 64) with radius 38 then Renders a red line between points (184, 242) and (266, 45) then Creates a cyan rectangular region at (333, 175) spanning 71 by 37 pixels.
; PLAN: r0=177(x), r1=64(y), r2=38(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=184(x1), r6=242(y1), r7=266(x2), r8=45(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=333(x), r11=175(y), r12=71(width), r13=37(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 177
LDI r1, 64
LDI r2, 38
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 184
LDI r6, 242
LDI r7, 266
LDI r8, 45
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 333
LDI r11, 175
LDI r12, 71
LDI r13, 37
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
