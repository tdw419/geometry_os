; DESCRIPTION: Composite: Places a yellow 103x31 rectangle at position (169, 216) then Places a purple circle of radius 75 at center (354, 96) then Places a white dot at position (482, 190).
; PLAN: r0=169(x), r1=216(y), r2=103(width), r3=31(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=354(x), r6=96(y), r7=75(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=482(x), r11=190(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 169
LDI r1, 216
LDI r2, 103
LDI r3, 31
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 354
LDI r6, 96
LDI r7, 75
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 482
LDI r11, 190
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
