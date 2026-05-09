; DESCRIPTION: Composite: Draws a cyan line from (133, 144) to (332, 72) then Places a cyan dot at position (236, 134) then Creates a orange circular shape at (165, 93) with radius 12.
; PLAN: r0=133(x1), r1=144(y1), r2=332(x2), r3=72(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=236(x), r6=134(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=165(x), r11=93(y), r12=12(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 133
LDI r1, 144
LDI r2, 332
LDI r3, 72
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 236
LDI r6, 134
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 165
LDI r11, 93
LDI r12, 12
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
