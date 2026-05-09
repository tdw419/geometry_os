; DESCRIPTION: Composite: Draws a black line from (62, 27) to (391, 107) then Sets a single yellow pixel at (428, 57) then Places a yellow circle of radius 28 at center (445, 187).
; PLAN: r0=62(x1), r1=27(y1), r2=391(x2), r3=107(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=428(x), r6=57(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=445(x), r11=187(y), r12=28(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 62
LDI r1, 27
LDI r2, 391
LDI r3, 107
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 428
LDI r6, 57
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 445
LDI r11, 187
LDI r12, 28
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
