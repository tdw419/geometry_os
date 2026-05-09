; DESCRIPTION: Composite: Draws a red circle centered at (99, 129) with radius 74 then Places a red 84x84 rectangle at position (126, 120) then Sets a single red pixel at (297, 84).
; PLAN: r0=99(x), r1=129(y), r2=74(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=126(x), r6=120(y), r7=84(width), r8=84(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=297(x), r11=84(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 99
LDI r1, 129
LDI r2, 74
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 126
LDI r6, 120
LDI r7, 84
LDI r8, 84
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 297
LDI r11, 84
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
