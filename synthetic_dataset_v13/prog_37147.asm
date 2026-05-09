; DESCRIPTION: Composite: Places a red dot at position (159, 163) then Places a white 91x51 rectangle at position (59, 181) then Places a magenta line segment connecting (472, 5) to (242, 52).
; PLAN: r0=159(x), r1=163(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=59(x), r6=181(y), r7=91(width), r8=51(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=472(x1), r11=5(y1), r12=242(x2), r13=52(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 159
LDI r1, 163
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 59
LDI r6, 181
LDI r7, 91
LDI r8, 51
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 472
LDI r11, 5
LDI r12, 242
LDI r13, 52
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
