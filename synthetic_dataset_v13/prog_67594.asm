; DESCRIPTION: Composite: Draws a magenta line from (352, 12) to (456, 46) then Places a yellow dot at position (178, 77) then Renders a purple disk with center (78, 114) and radius 39.
; PLAN: r0=352(x1), r1=12(y1), r2=456(x2), r3=46(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=178(x), r6=77(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=78(x), r11=114(y), r12=39(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 352
LDI r1, 12
LDI r2, 456
LDI r3, 46
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 178
LDI r6, 77
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 78
LDI r11, 114
LDI r12, 39
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
