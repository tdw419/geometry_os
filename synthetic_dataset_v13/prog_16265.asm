; DESCRIPTION: Composite: Creates a white rectangular region at (186, 53) spanning 13 by 92 pixels then Places a green line segment connecting (7, 86) to (376, 77) then Renders a cyan disk with center (236, 181) and radius 55.
; PLAN: r0=186(x), r1=53(y), r2=13(width), r3=92(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=7(x1), r6=86(y1), r7=376(x2), r8=77(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=236(x), r11=181(y), r12=55(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 186
LDI r1, 53
LDI r2, 13
LDI r3, 92
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 7
LDI r6, 86
LDI r7, 376
LDI r8, 77
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 236
LDI r11, 181
LDI r12, 55
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
