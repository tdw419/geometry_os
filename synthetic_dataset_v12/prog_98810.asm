; DESCRIPTION: Composite: Sets a single white pixel at (473, 85) then Renders a blue box of size 57x45 starting at (30, 83) then Places a white circle of radius 40 at center (193, 52).
; PLAN: r0=473(x), r1=85(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=30(x), r6=83(y), r7=57(width), r8=45(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=193(x), r11=52(y), r12=40(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 473
LDI r1, 85
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 30
LDI r6, 83
LDI r7, 57
LDI r8, 45
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 193
LDI r11, 52
LDI r12, 40
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
