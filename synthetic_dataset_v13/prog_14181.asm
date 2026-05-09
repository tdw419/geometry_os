; DESCRIPTION: Composite: Places a white dot at position (221, 49) then Places a cyan line segment connecting (411, 162) to (93, 225) then Renders a white box of size 37x45 starting at (336, 132).
; PLAN: r0=221(x), r1=49(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=411(x1), r6=162(y1), r7=93(x2), r8=225(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=336(x), r11=132(y), r12=37(width), r13=45(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 221
LDI r1, 49
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 411
LDI r6, 162
LDI r7, 93
LDI r8, 225
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 336
LDI r11, 132
LDI r12, 37
LDI r13, 45
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
