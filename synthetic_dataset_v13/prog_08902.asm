; DESCRIPTION: Composite: Renders a cyan box of size 102x116 starting at (47, 55) then Draws a black circle centered at (106, 66) with radius 20 then Renders a white line between points (354, 23) and (493, 81).
; PLAN: r0=47(x), r1=55(y), r2=102(width), r3=116(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=106(x), r6=66(y), r7=20(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=354(x1), r11=23(y1), r12=493(x2), r13=81(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 47
LDI r1, 55
LDI r2, 102
LDI r3, 116
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 106
LDI r6, 66
LDI r7, 20
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 354
LDI r11, 23
LDI r12, 493
LDI r13, 81
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
