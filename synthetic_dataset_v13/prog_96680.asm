; DESCRIPTION: Composite: Renders a black line between points (341, 129) and (458, 149) then Renders a cyan disk with center (419, 139) and radius 44 then Draws a cyan rectangle at (344, 199) with width 53 and height 26.
; PLAN: r0=341(x1), r1=129(y1), r2=458(x2), r3=149(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=419(x), r6=139(y), r7=44(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=344(x), r11=199(y), r12=53(width), r13=26(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 341
LDI r1, 129
LDI r2, 458
LDI r3, 149
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 419
LDI r6, 139
LDI r7, 44
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 344
LDI r11, 199
LDI r12, 53
LDI r13, 26
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
