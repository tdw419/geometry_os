; DESCRIPTION: Composite: Places a white 84x18 rectangle at position (294, 216) then Renders a purple disk with center (190, 130) and radius 73 then Sets a single orange pixel at (377, 207).
; PLAN: r0=294(x), r1=216(y), r2=84(width), r3=18(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=190(x), r6=130(y), r7=73(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=377(x), r11=207(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 294
LDI r1, 216
LDI r2, 84
LDI r3, 18
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 190
LDI r6, 130
LDI r7, 73
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 377
LDI r11, 207
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
