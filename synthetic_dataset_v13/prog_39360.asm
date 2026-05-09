; DESCRIPTION: Composite: Places a green 79x25 rectangle at position (116, 185) then Places a black circle of radius 53 at center (275, 187) then Places a purple dot at position (422, 192).
; PLAN: r0=116(x), r1=185(y), r2=79(width), r3=25(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=275(x), r6=187(y), r7=53(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=422(x), r11=192(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 116
LDI r1, 185
LDI r2, 79
LDI r3, 25
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 275
LDI r6, 187
LDI r7, 53
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 422
LDI r11, 192
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
