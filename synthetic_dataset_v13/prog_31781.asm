; DESCRIPTION: Composite: Draws a purple line from (238, 68) to (71, 222) then Places a purple dot at position (154, 98) then Renders a magenta disk with center (362, 150) and radius 30.
; PLAN: r0=238(x1), r1=68(y1), r2=71(x2), r3=222(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=154(x), r6=98(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=362(x), r11=150(y), r12=30(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 238
LDI r1, 68
LDI r2, 71
LDI r3, 222
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 154
LDI r6, 98
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 362
LDI r11, 150
LDI r12, 30
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
