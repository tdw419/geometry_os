; DESCRIPTION: Composite: Renders a red line between points (296, 193) and (313, 186) then Places a magenta dot at position (181, 11) then Places a blue 53x76 rectangle at position (438, 39).
; PLAN: r0=296(x1), r1=193(y1), r2=313(x2), r3=186(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=181(x), r6=11(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=438(x), r11=39(y), r12=53(width), r13=76(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 296
LDI r1, 193
LDI r2, 313
LDI r3, 186
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 181
LDI r6, 11
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 438
LDI r11, 39
LDI r12, 53
LDI r13, 76
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
