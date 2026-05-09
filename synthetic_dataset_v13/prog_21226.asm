; DESCRIPTION: Composite: Places a black circle of radius 33 at center (134, 108) then Draws a white line from (173, 171) to (43, 224) then Places a purple dot at position (301, 64).
; PLAN: r0=134(x), r1=108(y), r2=33(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=173(x1), r6=171(y1), r7=43(x2), r8=224(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=301(x), r11=64(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 134
LDI r1, 108
LDI r2, 33
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 173
LDI r6, 171
LDI r7, 43
LDI r8, 224
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 301
LDI r11, 64
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
