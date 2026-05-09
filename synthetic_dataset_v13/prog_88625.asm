; DESCRIPTION: Composite: Draws a red rectangle at (238, 3) with width 81 and height 82 then Places a green line segment connecting (257, 196) to (62, 97) then Sets a single green pixel at (335, 8).
; PLAN: r0=238(x), r1=3(y), r2=81(width), r3=82(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=257(x1), r6=196(y1), r7=62(x2), r8=97(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=335(x), r11=8(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 238
LDI r1, 3
LDI r2, 81
LDI r3, 82
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 257
LDI r6, 196
LDI r7, 62
LDI r8, 97
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 335
LDI r11, 8
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
