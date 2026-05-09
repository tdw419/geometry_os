; DESCRIPTION: Composite: Places a purple 29x99 rectangle at position (418, 32) then Renders a red disk with center (210, 30) and radius 26 then Sets a single black pixel at (24, 117).
; PLAN: r0=418(x), r1=32(y), r2=29(width), r3=99(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=210(x), r6=30(y), r7=26(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=24(x), r11=117(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 418
LDI r1, 32
LDI r2, 29
LDI r3, 99
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 210
LDI r6, 30
LDI r7, 26
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 24
LDI r11, 117
LDI r12, 0x000000
PSET r10, r11, r12
HALT
