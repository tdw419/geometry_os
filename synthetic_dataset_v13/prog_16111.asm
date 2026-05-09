; DESCRIPTION: Composite: Sets a single white pixel at (10, 185) then Places a cyan line segment connecting (323, 193) to (55, 241) then Places a purple 73x60 rectangle at position (399, 178).
; PLAN: r0=10(x), r1=185(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=323(x1), r6=193(y1), r7=55(x2), r8=241(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=399(x), r11=178(y), r12=73(width), r13=60(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 10
LDI r1, 185
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 323
LDI r6, 193
LDI r7, 55
LDI r8, 241
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 399
LDI r11, 178
LDI r12, 73
LDI r13, 60
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
