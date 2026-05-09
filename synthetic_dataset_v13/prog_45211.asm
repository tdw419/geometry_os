; DESCRIPTION: Composite: Renders a orange line between points (455, 147) and (180, 227) then Renders a orange box of size 47x45 starting at (73, 30) then Places a yellow dot at position (253, 199).
; PLAN: r0=455(x1), r1=147(y1), r2=180(x2), r3=227(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=73(x), r6=30(y), r7=47(width), r8=45(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=253(x), r11=199(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 455
LDI r1, 147
LDI r2, 180
LDI r3, 227
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 73
LDI r6, 30
LDI r7, 47
LDI r8, 45
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 253
LDI r11, 199
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
