; DESCRIPTION: Composite: Sets a single purple pixel at (199, 1) then Places a white 82x22 rectangle at position (286, 25) then Places a red circle of radius 24 at center (216, 67).
; PLAN: r0=199(x), r1=1(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=286(x), r6=25(y), r7=82(width), r8=22(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=216(x), r11=67(y), r12=24(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 199
LDI r1, 1
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 286
LDI r6, 25
LDI r7, 82
LDI r8, 22
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 216
LDI r11, 67
LDI r12, 24
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
