; DESCRIPTION: Composite: Draws a red line from (464, 178) to (186, 64) then Draws a green circle centered at (152, 79) with radius 61 then Places a yellow dot at position (495, 73).
; PLAN: r0=464(x1), r1=178(y1), r2=186(x2), r3=64(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=152(x), r6=79(y), r7=61(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=495(x), r11=73(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 464
LDI r1, 178
LDI r2, 186
LDI r3, 64
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 152
LDI r6, 79
LDI r7, 61
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 495
LDI r11, 73
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
