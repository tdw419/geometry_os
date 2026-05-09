; DESCRIPTION: Composite: Places a white line segment connecting (282, 218) to (286, 166) then Sets a single red pixel at (482, 35) then Places a cyan 42x21 rectangle at position (17, 178).
; PLAN: r0=282(x1), r1=218(y1), r2=286(x2), r3=166(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=482(x), r6=35(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=17(x), r11=178(y), r12=42(width), r13=21(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 282
LDI r1, 218
LDI r2, 286
LDI r3, 166
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 482
LDI r6, 35
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 17
LDI r11, 178
LDI r12, 42
LDI r13, 21
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
