; DESCRIPTION: Composite: Draws a red rectangle at (141, 75) with width 51 and height 60 then Draws a black line from (240, 137) to (228, 19) then Places a white circle of radius 34 at center (367, 182).
; PLAN: r0=141(x), r1=75(y), r2=51(width), r3=60(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=240(x1), r6=137(y1), r7=228(x2), r8=19(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=367(x), r11=182(y), r12=34(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 141
LDI r1, 75
LDI r2, 51
LDI r3, 60
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 240
LDI r6, 137
LDI r7, 228
LDI r8, 19
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 367
LDI r11, 182
LDI r12, 34
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
