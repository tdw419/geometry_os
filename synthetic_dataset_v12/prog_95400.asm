; DESCRIPTION: Composite: Draws a black line from (122, 173) to (36, 53) then Places a cyan dot at position (335, 242) then Creates a cyan circular shape at (444, 59) with radius 53.
; PLAN: r0=122(x1), r1=173(y1), r2=36(x2), r3=53(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=335(x), r6=242(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=444(x), r11=59(y), r12=53(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 122
LDI r1, 173
LDI r2, 36
LDI r3, 53
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 335
LDI r6, 242
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 444
LDI r11, 59
LDI r12, 53
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
