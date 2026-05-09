; DESCRIPTION: Composite: Creates a black rectangular region at (204, 13) spanning 35 by 13 pixels then Places a purple circle of radius 17 at center (88, 197) then Renders a cyan line between points (242, 44) and (425, 93).
; PLAN: r0=204(x), r1=13(y), r2=35(width), r3=13(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=88(x), r6=197(y), r7=17(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=242(x1), r11=44(y1), r12=425(x2), r13=93(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 204
LDI r1, 13
LDI r2, 35
LDI r3, 13
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 88
LDI r6, 197
LDI r7, 17
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 242
LDI r11, 44
LDI r12, 425
LDI r13, 93
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
