; DESCRIPTION: Composite: Places a blue dot at position (209, 188) then Places a magenta 104x106 rectangle at position (36, 67) then Renders a magenta line between points (337, 82) and (331, 20).
; PLAN: r0=209(x), r1=188(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=36(x), r6=67(y), r7=104(width), r8=106(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=337(x1), r11=82(y1), r12=331(x2), r13=20(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 209
LDI r1, 188
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 36
LDI r6, 67
LDI r7, 104
LDI r8, 106
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 337
LDI r11, 82
LDI r12, 331
LDI r13, 20
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
