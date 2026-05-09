; DESCRIPTION: Composite: Places a purple line segment connecting (394, 241) to (291, 95) then Places a purple 115x16 rectangle at position (338, 169).
; PLAN: r0=394(x1), r1=241(y1), r2=291(x2), r3=95(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=338(x), r6=169(y), r7=115(width), r8=16(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 394
LDI r1, 241
LDI r2, 291
LDI r3, 95
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 338
LDI r6, 169
LDI r7, 115
LDI r8, 16
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
