; DESCRIPTION: Composite: Places a cyan 17x38 rectangle at position (394, 17) then Sets a single red pixel at (327, 106) then Places a orange line segment connecting (386, 99) to (133, 239).
; PLAN: r0=394(x), r1=17(y), r2=17(width), r3=38(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=327(x), r6=106(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=386(x1), r11=99(y1), r12=133(x2), r13=239(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 394
LDI r1, 17
LDI r2, 17
LDI r3, 38
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 327
LDI r6, 106
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 386
LDI r11, 99
LDI r12, 133
LDI r13, 239
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
