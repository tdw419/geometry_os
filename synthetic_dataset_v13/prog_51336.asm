; DESCRIPTION: Composite: Renders a yellow box of size 32x101 starting at (354, 102) then Sets a single black pixel at (194, 102) then Places a white line segment connecting (18, 107) to (359, 171).
; PLAN: r0=354(x), r1=102(y), r2=32(width), r3=101(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=194(x), r6=102(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=18(x1), r11=107(y1), r12=359(x2), r13=171(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 354
LDI r1, 102
LDI r2, 32
LDI r3, 101
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 194
LDI r6, 102
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 18
LDI r11, 107
LDI r12, 359
LDI r13, 171
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
