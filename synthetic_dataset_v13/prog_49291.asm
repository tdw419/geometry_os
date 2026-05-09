; DESCRIPTION: Composite: Places a green 76x42 rectangle at position (167, 68) then Renders a white disk with center (372, 133) and radius 34 then Sets a single yellow pixel at (473, 15).
; PLAN: r0=167(x), r1=68(y), r2=76(width), r3=42(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=372(x), r6=133(y), r7=34(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=473(x), r11=15(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 167
LDI r1, 68
LDI r2, 76
LDI r3, 42
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 372
LDI r6, 133
LDI r7, 34
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 473
LDI r11, 15
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
