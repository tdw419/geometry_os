; DESCRIPTION: Composite: Renders a magenta box of size 24x56 starting at (1, 77) then Places a white dot at position (389, 66) then Places a white line segment connecting (403, 119) to (285, 41).
; PLAN: r0=1(x), r1=77(y), r2=24(width), r3=56(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=389(x), r6=66(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=403(x1), r11=119(y1), r12=285(x2), r13=41(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 1
LDI r1, 77
LDI r2, 24
LDI r3, 56
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 389
LDI r6, 66
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 403
LDI r11, 119
LDI r12, 285
LDI r13, 41
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
