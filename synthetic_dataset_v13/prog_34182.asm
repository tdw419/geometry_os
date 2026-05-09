; DESCRIPTION: Composite: Draws a magenta rectangle at (332, 28) with width 66 and height 95 then Sets a single blue pixel at (380, 169) then Places a magenta line segment connecting (129, 173) to (445, 27).
; PLAN: r0=332(x), r1=28(y), r2=66(width), r3=95(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=380(x), r6=169(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=129(x1), r11=173(y1), r12=445(x2), r13=27(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 332
LDI r1, 28
LDI r2, 66
LDI r3, 95
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 380
LDI r6, 169
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 129
LDI r11, 173
LDI r12, 445
LDI r13, 27
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
