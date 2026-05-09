; DESCRIPTION: Composite: Draws a blue line from (316, 26) to (65, 173) then Draws a white circle centered at (95, 103) with radius 56 then Places a magenta dot at position (152, 226).
; PLAN: r0=316(x1), r1=26(y1), r2=65(x2), r3=173(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=95(x), r6=103(y), r7=56(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=152(x), r11=226(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 316
LDI r1, 26
LDI r2, 65
LDI r3, 173
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 95
LDI r6, 103
LDI r7, 56
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 152
LDI r11, 226
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
