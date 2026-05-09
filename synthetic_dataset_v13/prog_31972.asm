; DESCRIPTION: Composite: Places a cyan line segment connecting (342, 64) to (317, 167) then Places a magenta dot at position (63, 46) then Renders a purple disk with center (330, 41) and radius 36.
; PLAN: r0=342(x1), r1=64(y1), r2=317(x2), r3=167(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=63(x), r6=46(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=330(x), r11=41(y), r12=36(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 342
LDI r1, 64
LDI r2, 317
LDI r3, 167
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 63
LDI r6, 46
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 330
LDI r11, 41
LDI r12, 36
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
