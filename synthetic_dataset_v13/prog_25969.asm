; DESCRIPTION: Composite: Places a blue dot at position (44, 65) then Draws a orange circle centered at (415, 114) with radius 34 then Draws a red line from (102, 141) to (63, 146).
; PLAN: r0=44(x), r1=65(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=415(x), r6=114(y), r7=34(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=102(x1), r11=141(y1), r12=63(x2), r13=146(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 44
LDI r1, 65
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 415
LDI r6, 114
LDI r7, 34
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 102
LDI r11, 141
LDI r12, 63
LDI r13, 146
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
