; DESCRIPTION: Composite: Places a white line segment connecting (61, 75) to (17, 120) then Places a blue 111x106 rectangle at position (144, 144) then Sets a single purple pixel at (47, 204).
; PLAN: r0=61(x1), r1=75(y1), r2=17(x2), r3=120(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=144(x), r6=144(y), r7=111(width), r8=106(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=47(x), r11=204(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 61
LDI r1, 75
LDI r2, 17
LDI r3, 120
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 144
LDI r6, 144
LDI r7, 111
LDI r8, 106
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 47
LDI r11, 204
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
