; DESCRIPTION: Composite: Sets a single cyan pixel at (220, 28) then Draws a yellow rectangle at (263, 169) with width 118 and height 67 then Places a blue circle of radius 68 at center (94, 162).
; PLAN: r0=220(x), r1=28(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=263(x), r6=169(y), r7=118(width), r8=67(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=94(x), r11=162(y), r12=68(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 220
LDI r1, 28
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 263
LDI r6, 169
LDI r7, 118
LDI r8, 67
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 94
LDI r11, 162
LDI r12, 68
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
