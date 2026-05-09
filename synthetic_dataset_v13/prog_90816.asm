; DESCRIPTION: Composite: Places a cyan 103x71 rectangle at position (0, 109) then Places a purple dot at position (219, 244) then Places a purple circle of radius 56 at center (417, 146).
; PLAN: r0=0(x), r1=109(y), r2=103(width), r3=71(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=219(x), r6=244(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=417(x), r11=146(y), r12=56(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 0
LDI r1, 109
LDI r2, 103
LDI r3, 71
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 219
LDI r6, 244
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 417
LDI r11, 146
LDI r12, 56
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
