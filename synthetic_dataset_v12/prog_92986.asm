; DESCRIPTION: Composite: Renders a purple disk with center (247, 92) and radius 44 then Renders a white box of size 56x119 starting at (432, 46) then Draws a red line from (275, 238) to (10, 55).
; PLAN: r0=247(x), r1=92(y), r2=44(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=432(x), r6=46(y), r7=56(width), r8=119(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=275(x1), r11=238(y1), r12=10(x2), r13=55(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 247
LDI r1, 92
LDI r2, 44
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 432
LDI r6, 46
LDI r7, 56
LDI r8, 119
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 275
LDI r11, 238
LDI r12, 10
LDI r13, 55
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
