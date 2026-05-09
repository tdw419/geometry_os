; DESCRIPTION: Composite: Creates a cyan circular shape at (278, 139) with radius 74 then Draws a magenta line from (494, 52) to (249, 159) then Creates a magenta rectangular region at (193, 34) spanning 41 by 29 pixels.
; PLAN: r0=278(x), r1=139(y), r2=74(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=494(x1), r6=52(y1), r7=249(x2), r8=159(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=193(x), r11=34(y), r12=41(width), r13=29(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 278
LDI r1, 139
LDI r2, 74
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 494
LDI r6, 52
LDI r7, 249
LDI r8, 159
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 193
LDI r11, 34
LDI r12, 41
LDI r13, 29
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
