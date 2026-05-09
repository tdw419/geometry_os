; DESCRIPTION: Composite: Places a red dot at position (196, 174) then Places a purple circle of radius 77 at center (248, 164) then Renders a orange line between points (383, 39) and (323, 187).
; PLAN: r0=196(x), r1=174(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=248(x), r6=164(y), r7=77(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=383(x1), r11=39(y1), r12=323(x2), r13=187(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 196
LDI r1, 174
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 248
LDI r6, 164
LDI r7, 77
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 383
LDI r11, 39
LDI r12, 323
LDI r13, 187
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
