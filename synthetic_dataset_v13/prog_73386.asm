; DESCRIPTION: Composite: Places a white dot at position (131, 247) then Places a magenta line segment connecting (166, 215) to (288, 75) then Places a blue 90x43 rectangle at position (0, 171).
; PLAN: r0=131(x), r1=247(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=166(x1), r6=215(y1), r7=288(x2), r8=75(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=0(x), r11=171(y), r12=90(width), r13=43(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 131
LDI r1, 247
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 166
LDI r6, 215
LDI r7, 288
LDI r8, 75
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 0
LDI r11, 171
LDI r12, 90
LDI r13, 43
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
