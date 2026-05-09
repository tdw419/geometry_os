; DESCRIPTION: Composite: Renders a red line between points (166, 134) and (157, 94) then Renders a white box of size 31x64 starting at (276, 139) then Places a black circle of radius 28 at center (213, 202).
; PLAN: r0=166(x1), r1=134(y1), r2=157(x2), r3=94(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=276(x), r6=139(y), r7=31(width), r8=64(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=213(x), r11=202(y), r12=28(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 166
LDI r1, 134
LDI r2, 157
LDI r3, 94
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 276
LDI r6, 139
LDI r7, 31
LDI r8, 64
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 213
LDI r11, 202
LDI r12, 28
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
