; DESCRIPTION: Composite: Sets a single red pixel at (222, 60) then Renders a cyan box of size 11x53 starting at (333, 48) then Places a cyan line segment connecting (296, 95) to (375, 176).
; PLAN: r0=222(x), r1=60(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=333(x), r6=48(y), r7=11(width), r8=53(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=296(x1), r11=95(y1), r12=375(x2), r13=176(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 222
LDI r1, 60
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 333
LDI r6, 48
LDI r7, 11
LDI r8, 53
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 296
LDI r11, 95
LDI r12, 375
LDI r13, 176
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
