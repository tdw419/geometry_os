; DESCRIPTION: Composite: Places a white dot at position (416, 208) then Draws a blue rectangle at (303, 41) with width 99 and height 11 then Places a red circle of radius 41 at center (142, 76).
; PLAN: r0=416(x), r1=208(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=303(x), r6=41(y), r7=99(width), r8=11(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=142(x), r11=76(y), r12=41(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 416
LDI r1, 208
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 303
LDI r6, 41
LDI r7, 99
LDI r8, 11
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 142
LDI r11, 76
LDI r12, 41
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
