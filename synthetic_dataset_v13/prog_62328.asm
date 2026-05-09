; DESCRIPTION: Composite: Places a red line segment connecting (145, 105) to (2, 92) then Places a red dot at position (220, 45) then Renders a orange box of size 46x57 starting at (298, 33).
; PLAN: r0=145(x1), r1=105(y1), r2=2(x2), r3=92(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=220(x), r6=45(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=298(x), r11=33(y), r12=46(width), r13=57(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 145
LDI r1, 105
LDI r2, 2
LDI r3, 92
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 220
LDI r6, 45
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 298
LDI r11, 33
LDI r12, 46
LDI r13, 57
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
