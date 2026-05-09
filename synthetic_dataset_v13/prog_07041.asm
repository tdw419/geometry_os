; DESCRIPTION: Composite: Places a red line segment connecting (81, 254) to (509, 182) then Creates a white rectangular region at (388, 189) spanning 76 by 40 pixels then Places a blue dot at position (255, 40).
; PLAN: r0=81(x1), r1=254(y1), r2=509(x2), r3=182(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=388(x), r6=189(y), r7=76(width), r8=40(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=255(x), r11=40(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 81
LDI r1, 254
LDI r2, 509
LDI r3, 182
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 388
LDI r6, 189
LDI r7, 76
LDI r8, 40
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 255
LDI r11, 40
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
