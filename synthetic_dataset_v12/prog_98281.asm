; DESCRIPTION: Composite: Places a white dot at position (229, 93) then Draws a blue line from (459, 100) to (434, 161) then Renders a orange disk with center (267, 195) and radius 53.
; PLAN: r0=229(x), r1=93(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=459(x1), r6=100(y1), r7=434(x2), r8=161(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=267(x), r11=195(y), r12=53(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 229
LDI r1, 93
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 459
LDI r6, 100
LDI r7, 434
LDI r8, 161
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 267
LDI r11, 195
LDI r12, 53
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
