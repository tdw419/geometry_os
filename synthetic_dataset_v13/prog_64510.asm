; DESCRIPTION: Composite: Creates a black circular shape at (113, 97) with radius 69 then Draws a white line from (469, 166) to (127, 114) then Places a purple dot at position (194, 127).
; PLAN: r0=113(x), r1=97(y), r2=69(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=469(x1), r6=166(y1), r7=127(x2), r8=114(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=194(x), r11=127(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 113
LDI r1, 97
LDI r2, 69
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 469
LDI r6, 166
LDI r7, 127
LDI r8, 114
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 194
LDI r11, 127
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
