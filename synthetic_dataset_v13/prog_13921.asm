; DESCRIPTION: Composite: Places a purple dot at position (207, 241) then Renders a yellow disk with center (223, 76) and radius 61 then Draws a cyan line from (26, 140) to (428, 7).
; PLAN: r0=207(x), r1=241(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=223(x), r6=76(y), r7=61(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=26(x1), r11=140(y1), r12=428(x2), r13=7(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 207
LDI r1, 241
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 223
LDI r6, 76
LDI r7, 61
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 26
LDI r11, 140
LDI r12, 428
LDI r13, 7
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
