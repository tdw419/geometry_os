; DESCRIPTION: Composite: Draws a red line from (304, 51) to (458, 148) then Creates a white circular shape at (214, 84) with radius 68 then Creates a cyan rectangular region at (343, 120) spanning 18 by 93 pixels.
; PLAN: r0=304(x1), r1=51(y1), r2=458(x2), r3=148(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=214(x), r6=84(y), r7=68(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=343(x), r11=120(y), r12=18(width), r13=93(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 304
LDI r1, 51
LDI r2, 458
LDI r3, 148
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 214
LDI r6, 84
LDI r7, 68
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 343
LDI r11, 120
LDI r12, 18
LDI r13, 93
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
