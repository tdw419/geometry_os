; DESCRIPTION: Composite: Places a cyan dot at position (2, 24) then Places a black circle of radius 40 at center (106, 158) then Renders a white line between points (100, 53) and (501, 127).
; PLAN: r0=2(x), r1=24(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=106(x), r6=158(y), r7=40(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=100(x1), r11=53(y1), r12=501(x2), r13=127(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 2
LDI r1, 24
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 106
LDI r6, 158
LDI r7, 40
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 100
LDI r11, 53
LDI r12, 501
LDI r13, 127
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
