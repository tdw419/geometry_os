; DESCRIPTION: Composite: Places a cyan dot at position (150, 110) then Places a cyan line segment connecting (255, 55) to (306, 12) then Draws a yellow rectangle at (280, 138) with width 43 and height 43.
; PLAN: r0=150(x), r1=110(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=255(x1), r6=55(y1), r7=306(x2), r8=12(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=280(x), r11=138(y), r12=43(width), r13=43(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 150
LDI r1, 110
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 255
LDI r6, 55
LDI r7, 306
LDI r8, 12
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 280
LDI r11, 138
LDI r12, 43
LDI r13, 43
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
