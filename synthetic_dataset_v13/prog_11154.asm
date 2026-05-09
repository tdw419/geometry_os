; DESCRIPTION: Composite: Places a white line segment connecting (374, 92) to (299, 76) then Renders a purple box of size 118x12 starting at (156, 13) then Places a black dot at position (150, 235).
; PLAN: r0=374(x1), r1=92(y1), r2=299(x2), r3=76(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=156(x), r6=13(y), r7=118(width), r8=12(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=150(x), r11=235(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 374
LDI r1, 92
LDI r2, 299
LDI r3, 76
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 156
LDI r6, 13
LDI r7, 118
LDI r8, 12
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 150
LDI r11, 235
LDI r12, 0x000000
PSET r10, r11, r12
HALT
