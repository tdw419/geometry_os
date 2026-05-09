; DESCRIPTION: Composite: Creates a cyan circular shape at (406, 165) with radius 53 then Creates a orange rectangular region at (194, 115) spanning 110 by 116 pixels then Renders a yellow line between points (179, 7) and (298, 70).
; PLAN: r0=406(x), r1=165(y), r2=53(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=194(x), r6=115(y), r7=110(width), r8=116(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=179(x1), r11=7(y1), r12=298(x2), r13=70(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 406
LDI r1, 165
LDI r2, 53
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 194
LDI r6, 115
LDI r7, 110
LDI r8, 116
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 179
LDI r11, 7
LDI r12, 298
LDI r13, 70
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
