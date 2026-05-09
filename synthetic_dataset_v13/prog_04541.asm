; DESCRIPTION: Composite: Places a black circle of radius 58 at center (353, 98) then Draws a blue line from (138, 23) to (228, 133) then Places a red dot at position (300, 148).
; PLAN: r0=353(x), r1=98(y), r2=58(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=138(x1), r6=23(y1), r7=228(x2), r8=133(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=300(x), r11=148(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 353
LDI r1, 98
LDI r2, 58
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 138
LDI r6, 23
LDI r7, 228
LDI r8, 133
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 300
LDI r11, 148
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
