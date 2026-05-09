; DESCRIPTION: Composite: Draws a cyan rectangle at (187, 9) with width 98 and height 119 then Places a green line segment connecting (344, 247) to (42, 202) then Draws a cyan circle centered at (127, 177) with radius 40.
; PLAN: r0=187(x), r1=9(y), r2=98(width), r3=119(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=344(x1), r6=247(y1), r7=42(x2), r8=202(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=127(x), r11=177(y), r12=40(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 187
LDI r1, 9
LDI r2, 98
LDI r3, 119
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 344
LDI r6, 247
LDI r7, 42
LDI r8, 202
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 127
LDI r11, 177
LDI r12, 40
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
