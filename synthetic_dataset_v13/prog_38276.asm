; DESCRIPTION: Composite: Places a cyan circle of radius 37 at center (254, 98) then Renders a white line between points (301, 52) and (247, 156) then Creates a purple rectangular region at (239, 134) spanning 49 by 115 pixels.
; PLAN: r0=254(x), r1=98(y), r2=37(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=301(x1), r6=52(y1), r7=247(x2), r8=156(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=239(x), r11=134(y), r12=49(width), r13=115(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 254
LDI r1, 98
LDI r2, 37
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 301
LDI r6, 52
LDI r7, 247
LDI r8, 156
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 239
LDI r11, 134
LDI r12, 49
LDI r13, 115
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
