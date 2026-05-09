; DESCRIPTION: Composite: Renders a green disk with center (454, 74) and radius 14 then Places a purple dot at position (355, 86) then Renders a blue box of size 82x87 starting at (281, 64).
; PLAN: r0=454(x), r1=74(y), r2=14(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=355(x), r6=86(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=281(x), r11=64(y), r12=82(width), r13=87(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 454
LDI r1, 74
LDI r2, 14
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 355
LDI r6, 86
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 281
LDI r11, 64
LDI r12, 82
LDI r13, 87
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
