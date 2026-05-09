; DESCRIPTION: Composite: Renders a white line between points (258, 176) and (265, 103) then Creates a white rectangular region at (303, 107) spanning 116 by 63 pixels then Creates a black circular shape at (243, 190) with radius 18.
; PLAN: r0=258(x1), r1=176(y1), r2=265(x2), r3=103(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=303(x), r6=107(y), r7=116(width), r8=63(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=243(x), r11=190(y), r12=18(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 258
LDI r1, 176
LDI r2, 265
LDI r3, 103
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 303
LDI r6, 107
LDI r7, 116
LDI r8, 63
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 243
LDI r11, 190
LDI r12, 18
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
