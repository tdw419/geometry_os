; DESCRIPTION: Composite: Places a orange 31x17 rectangle at position (480, 91) then Renders a orange line between points (474, 208) and (479, 126) then Sets a single magenta pixel at (31, 233).
; PLAN: r0=480(x), r1=91(y), r2=31(width), r3=17(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=474(x1), r6=208(y1), r7=479(x2), r8=126(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=31(x), r11=233(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 480
LDI r1, 91
LDI r2, 31
LDI r3, 17
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 474
LDI r6, 208
LDI r7, 479
LDI r8, 126
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 31
LDI r11, 233
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
