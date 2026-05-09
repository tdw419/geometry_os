; DESCRIPTION: Composite: Draws a cyan rectangle at (303, 130) with width 28 and height 46 then Places a green line segment connecting (347, 114) to (176, 68).
; PLAN: r0=303(x), r1=130(y), r2=28(width), r3=46(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=347(x1), r6=114(y1), r7=176(x2), r8=68(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 303
LDI r1, 130
LDI r2, 28
LDI r3, 46
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 347
LDI r6, 114
LDI r7, 176
LDI r8, 68
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
