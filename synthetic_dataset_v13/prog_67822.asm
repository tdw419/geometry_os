; DESCRIPTION: Composite: Places a white dot at position (130, 161) then Places a purple circle of radius 66 at center (323, 124) then Creates a red rectangular region at (73, 114) spanning 38 by 40 pixels.
; PLAN: r0=130(x), r1=161(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=323(x), r6=124(y), r7=66(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=73(x), r11=114(y), r12=38(width), r13=40(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 130
LDI r1, 161
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 323
LDI r6, 124
LDI r7, 66
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 73
LDI r11, 114
LDI r12, 38
LDI r13, 40
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
