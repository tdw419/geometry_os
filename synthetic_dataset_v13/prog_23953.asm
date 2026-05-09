; DESCRIPTION: Composite: Places a orange 83x21 rectangle at position (309, 171) then Places a white dot at position (263, 25) then Draws a magenta line from (65, 237) to (57, 92).
; PLAN: r0=309(x), r1=171(y), r2=83(width), r3=21(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=263(x), r6=25(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=65(x1), r11=237(y1), r12=57(x2), r13=92(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 309
LDI r1, 171
LDI r2, 83
LDI r3, 21
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 263
LDI r6, 25
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 65
LDI r11, 237
LDI r12, 57
LDI r13, 92
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
