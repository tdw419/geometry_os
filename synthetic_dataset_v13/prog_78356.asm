; DESCRIPTION: Composite: Renders a blue disk with center (215, 203) and radius 23 then Places a black dot at position (374, 245) then Draws a cyan line from (31, 66) to (438, 167).
; PLAN: r0=215(x), r1=203(y), r2=23(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=374(x), r6=245(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=31(x1), r11=66(y1), r12=438(x2), r13=167(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 215
LDI r1, 203
LDI r2, 23
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 374
LDI r6, 245
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 31
LDI r11, 66
LDI r12, 438
LDI r13, 167
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
