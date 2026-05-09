; DESCRIPTION: Composite: Renders a magenta line between points (108, 177) and (309, 26) then Sets a single orange pixel at (460, 213) then Creates a blue rectangular region at (299, 204) spanning 115 by 41 pixels.
; PLAN: r0=108(x1), r1=177(y1), r2=309(x2), r3=26(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=460(x), r6=213(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=299(x), r11=204(y), r12=115(width), r13=41(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 108
LDI r1, 177
LDI r2, 309
LDI r3, 26
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 460
LDI r6, 213
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 299
LDI r11, 204
LDI r12, 115
LDI r13, 41
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
