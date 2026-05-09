; DESCRIPTION: Composite: Draws a red rectangle at (291, 34) with width 77 and height 53 then Places a purple dot at position (422, 240) then Places a magenta line segment connecting (121, 140) to (92, 18).
; PLAN: r0=291(x), r1=34(y), r2=77(width), r3=53(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=422(x), r6=240(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=121(x1), r11=140(y1), r12=92(x2), r13=18(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 291
LDI r1, 34
LDI r2, 77
LDI r3, 53
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 422
LDI r6, 240
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 121
LDI r11, 140
LDI r12, 92
LDI r13, 18
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
