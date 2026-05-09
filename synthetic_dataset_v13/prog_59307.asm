; DESCRIPTION: Composite: Creates a red rectangular region at (159, 120) spanning 116 by 52 pixels then Places a cyan line segment connecting (358, 115) to (44, 107) then Creates a green circular shape at (214, 125) with radius 52.
; PLAN: r0=159(x), r1=120(y), r2=116(width), r3=52(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=358(x1), r6=115(y1), r7=44(x2), r8=107(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=214(x), r11=125(y), r12=52(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 159
LDI r1, 120
LDI r2, 116
LDI r3, 52
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 358
LDI r6, 115
LDI r7, 44
LDI r8, 107
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 214
LDI r11, 125
LDI r12, 52
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
