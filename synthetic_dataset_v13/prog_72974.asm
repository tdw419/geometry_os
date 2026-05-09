; DESCRIPTION: Composite: Places a magenta dot at position (101, 153) then Draws a cyan rectangle at (73, 220) with width 104 and height 35 then Places a purple line segment connecting (156, 177) to (150, 140).
; PLAN: r0=101(x), r1=153(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=73(x), r6=220(y), r7=104(width), r8=35(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=156(x1), r11=177(y1), r12=150(x2), r13=140(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 101
LDI r1, 153
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 73
LDI r6, 220
LDI r7, 104
LDI r8, 35
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 156
LDI r11, 177
LDI r12, 150
LDI r13, 140
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
