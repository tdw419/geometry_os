; DESCRIPTION: Composite: Creates a white circular shape at (353, 117) with radius 17 then Places a purple dot at position (417, 149) then Draws a yellow line from (46, 168) to (122, 78).
; PLAN: r0=353(x), r1=117(y), r2=17(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=417(x), r6=149(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=46(x1), r11=168(y1), r12=122(x2), r13=78(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 353
LDI r1, 117
LDI r2, 17
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 417
LDI r6, 149
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 46
LDI r11, 168
LDI r12, 122
LDI r13, 78
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
