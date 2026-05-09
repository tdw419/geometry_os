; DESCRIPTION: Composite: Renders a orange box of size 40x59 starting at (412, 81) then Places a orange line segment connecting (427, 92) to (104, 142) then Sets a single magenta pixel at (299, 89).
; PLAN: r0=412(x), r1=81(y), r2=40(width), r3=59(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=427(x1), r6=92(y1), r7=104(x2), r8=142(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=299(x), r11=89(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 412
LDI r1, 81
LDI r2, 40
LDI r3, 59
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 427
LDI r6, 92
LDI r7, 104
LDI r8, 142
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 299
LDI r11, 89
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
