; DESCRIPTION: Composite: Places a purple line segment connecting (430, 208) to (265, 210) then Places a red 110x64 rectangle at position (79, 30) then Sets a single white pixel at (3, 76).
; PLAN: r0=430(x1), r1=208(y1), r2=265(x2), r3=210(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=79(x), r6=30(y), r7=110(width), r8=64(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=3(x), r11=76(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 430
LDI r1, 208
LDI r2, 265
LDI r3, 210
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 79
LDI r6, 30
LDI r7, 110
LDI r8, 64
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 3
LDI r11, 76
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
