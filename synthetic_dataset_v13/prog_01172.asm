; DESCRIPTION: Composite: Places a black 58x71 rectangle at position (156, 98) then Draws a orange circle centered at (238, 154) with radius 18 then Renders a black line between points (437, 124) and (225, 54).
; PLAN: r0=156(x), r1=98(y), r2=58(width), r3=71(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=238(x), r6=154(y), r7=18(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=437(x1), r11=124(y1), r12=225(x2), r13=54(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 156
LDI r1, 98
LDI r2, 58
LDI r3, 71
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 238
LDI r6, 154
LDI r7, 18
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 437
LDI r11, 124
LDI r12, 225
LDI r13, 54
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
