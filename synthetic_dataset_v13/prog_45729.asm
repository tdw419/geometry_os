; DESCRIPTION: Composite: Places a red dot at position (103, 4) then Draws a cyan rectangle at (54, 19) with width 54 and height 68 then Draws a red circle centered at (336, 52) with radius 46.
; PLAN: r0=103(x), r1=4(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=54(x), r6=19(y), r7=54(width), r8=68(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=336(x), r11=52(y), r12=46(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 103
LDI r1, 4
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 54
LDI r6, 19
LDI r7, 54
LDI r8, 68
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 336
LDI r11, 52
LDI r12, 46
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
