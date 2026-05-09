; DESCRIPTION: Composite: Places a red circle of radius 44 at center (339, 168) then Draws a green rectangle at (353, 54) with width 35 and height 103 then Places a white dot at position (443, 6).
; PLAN: r0=339(x), r1=168(y), r2=44(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=353(x), r6=54(y), r7=35(width), r8=103(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=443(x), r11=6(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 339
LDI r1, 168
LDI r2, 44
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 353
LDI r6, 54
LDI r7, 35
LDI r8, 103
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 443
LDI r11, 6
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
