; DESCRIPTION: Composite: Creates a magenta rectangular region at (294, 52) spanning 92 by 25 pixels then Places a orange circle of radius 18 at center (481, 120) then Renders a orange line between points (389, 89) and (163, 37).
; PLAN: r0=294(x), r1=52(y), r2=92(width), r3=25(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=481(x), r6=120(y), r7=18(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=389(x1), r11=89(y1), r12=163(x2), r13=37(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 294
LDI r1, 52
LDI r2, 92
LDI r3, 25
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 481
LDI r6, 120
LDI r7, 18
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 389
LDI r11, 89
LDI r12, 163
LDI r13, 37
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
