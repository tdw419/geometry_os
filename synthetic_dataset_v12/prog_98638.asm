; DESCRIPTION: Composite: Sets a single magenta pixel at (203, 91) then Places a magenta line segment connecting (174, 21) to (197, 207) then Places a green 29x95 rectangle at position (113, 148).
; PLAN: r0=203(x), r1=91(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=174(x1), r6=21(y1), r7=197(x2), r8=207(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=113(x), r11=148(y), r12=29(width), r13=95(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 203
LDI r1, 91
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 174
LDI r6, 21
LDI r7, 197
LDI r8, 207
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 113
LDI r11, 148
LDI r12, 29
LDI r13, 95
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
