; DESCRIPTION: Composite: Renders a black disk with center (428, 106) and radius 34 then Places a cyan dot at position (473, 164) then Draws a white line from (132, 153) to (49, 198).
; PLAN: r0=428(x), r1=106(y), r2=34(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=473(x), r6=164(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=132(x1), r11=153(y1), r12=49(x2), r13=198(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 428
LDI r1, 106
LDI r2, 34
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 473
LDI r6, 164
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 132
LDI r11, 153
LDI r12, 49
LDI r13, 198
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
