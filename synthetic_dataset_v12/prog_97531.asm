; DESCRIPTION: Composite: Draws a white rectangle at (142, 26) with width 40 and height 91 then Draws a cyan line from (336, 78) to (367, 199) then Places a white circle of radius 24 at center (139, 152).
; PLAN: r0=142(x), r1=26(y), r2=40(width), r3=91(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=336(x1), r6=78(y1), r7=367(x2), r8=199(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=139(x), r11=152(y), r12=24(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 142
LDI r1, 26
LDI r2, 40
LDI r3, 91
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 336
LDI r6, 78
LDI r7, 367
LDI r8, 199
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 139
LDI r11, 152
LDI r12, 24
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
