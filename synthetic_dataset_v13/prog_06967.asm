; DESCRIPTION: Composite: Draws a white line from (94, 223) to (41, 44) then Places a red circle of radius 70 at center (199, 182) then Creates a cyan rectangular region at (306, 116) spanning 19 by 12 pixels.
; PLAN: r0=94(x1), r1=223(y1), r2=41(x2), r3=44(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=199(x), r6=182(y), r7=70(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=306(x), r11=116(y), r12=19(width), r13=12(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 94
LDI r1, 223
LDI r2, 41
LDI r3, 44
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 199
LDI r6, 182
LDI r7, 70
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 306
LDI r11, 116
LDI r12, 19
LDI r13, 12
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
