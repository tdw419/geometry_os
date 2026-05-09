; DESCRIPTION: Composite: Places a red line segment connecting (227, 201) to (324, 153) then Places a cyan 37x45 rectangle at position (299, 164) then Sets a single yellow pixel at (317, 198).
; PLAN: r0=227(x1), r1=201(y1), r2=324(x2), r3=153(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=299(x), r6=164(y), r7=37(width), r8=45(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=317(x), r11=198(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 227
LDI r1, 201
LDI r2, 324
LDI r3, 153
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 299
LDI r6, 164
LDI r7, 37
LDI r8, 45
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 317
LDI r11, 198
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
