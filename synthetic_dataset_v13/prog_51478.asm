; DESCRIPTION: Composite: Creates a white rectangular region at (213, 84) spanning 63 by 28 pixels then Places a purple dot at position (492, 212) then Draws a cyan line from (51, 232) to (165, 195).
; PLAN: r0=213(x), r1=84(y), r2=63(width), r3=28(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=492(x), r6=212(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=51(x1), r11=232(y1), r12=165(x2), r13=195(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 213
LDI r1, 84
LDI r2, 63
LDI r3, 28
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 492
LDI r6, 212
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 51
LDI r11, 232
LDI r12, 165
LDI r13, 195
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
