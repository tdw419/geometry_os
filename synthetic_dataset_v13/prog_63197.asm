; DESCRIPTION: Composite: Places a white dot at position (497, 99) then Places a white circle of radius 75 at center (190, 111) then Renders a purple box of size 109x81 starting at (215, 118).
; PLAN: r0=497(x), r1=99(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=190(x), r6=111(y), r7=75(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=215(x), r11=118(y), r12=109(width), r13=81(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 497
LDI r1, 99
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 190
LDI r6, 111
LDI r7, 75
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 215
LDI r11, 118
LDI r12, 109
LDI r13, 81
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
