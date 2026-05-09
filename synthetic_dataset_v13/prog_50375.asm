; DESCRIPTION: Composite: Places a white circle of radius 54 at center (353, 106) then Draws a black rectangle at (40, 208) with width 70 and height 32 then Places a white dot at position (125, 133).
; PLAN: r0=353(x), r1=106(y), r2=54(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=40(x), r6=208(y), r7=70(width), r8=32(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=125(x), r11=133(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 353
LDI r1, 106
LDI r2, 54
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 40
LDI r6, 208
LDI r7, 70
LDI r8, 32
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 125
LDI r11, 133
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
