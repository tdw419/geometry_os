; DESCRIPTION: Composite: Renders a white line between points (281, 199) and (113, 65) then Renders a white box of size 88x63 starting at (251, 95) then Places a magenta dot at position (375, 3).
; PLAN: r0=281(x1), r1=199(y1), r2=113(x2), r3=65(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=251(x), r6=95(y), r7=88(width), r8=63(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=375(x), r11=3(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 281
LDI r1, 199
LDI r2, 113
LDI r3, 65
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 251
LDI r6, 95
LDI r7, 88
LDI r8, 63
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 375
LDI r11, 3
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
