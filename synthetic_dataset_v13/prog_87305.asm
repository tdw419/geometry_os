; DESCRIPTION: Composite: Places a black circle of radius 63 at center (310, 64) then Renders a red line between points (321, 74) and (11, 176) then Creates a cyan rectangular region at (364, 49) spanning 84 by 57 pixels.
; PLAN: r0=310(x), r1=64(y), r2=63(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=321(x1), r6=74(y1), r7=11(x2), r8=176(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=364(x), r11=49(y), r12=84(width), r13=57(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 310
LDI r1, 64
LDI r2, 63
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 321
LDI r6, 74
LDI r7, 11
LDI r8, 176
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 364
LDI r11, 49
LDI r12, 84
LDI r13, 57
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
