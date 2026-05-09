; DESCRIPTION: Composite: Draws a red circle centered at (279, 186) with radius 30 then Places a blue 56x41 rectangle at position (163, 186) then Renders a cyan line between points (184, 162) and (91, 71).
; PLAN: r0=279(x), r1=186(y), r2=30(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=163(x), r6=186(y), r7=56(width), r8=41(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=184(x1), r11=162(y1), r12=91(x2), r13=71(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 279
LDI r1, 186
LDI r2, 30
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 163
LDI r6, 186
LDI r7, 56
LDI r8, 41
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 184
LDI r11, 162
LDI r12, 91
LDI r13, 71
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
