; DESCRIPTION: Composite: Places a purple 24x47 rectangle at position (91, 139) then Places a white circle of radius 40 at center (228, 180) then Sets a single black pixel at (498, 57).
; PLAN: r0=91(x), r1=139(y), r2=24(width), r3=47(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=228(x), r6=180(y), r7=40(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=498(x), r11=57(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 91
LDI r1, 139
LDI r2, 24
LDI r3, 47
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 228
LDI r6, 180
LDI r7, 40
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 498
LDI r11, 57
LDI r12, 0x000000
PSET r10, r11, r12
HALT
