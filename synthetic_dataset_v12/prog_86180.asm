; DESCRIPTION: Composite: Places a green 30x64 rectangle at position (23, 160) then Places a red dot at position (421, 201) then Places a orange line segment connecting (144, 6) to (430, 30).
; PLAN: r0=23(x), r1=160(y), r2=30(width), r3=64(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=421(x), r6=201(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=144(x1), r11=6(y1), r12=430(x2), r13=30(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 23
LDI r1, 160
LDI r2, 30
LDI r3, 64
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 421
LDI r6, 201
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 144
LDI r11, 6
LDI r12, 430
LDI r13, 30
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
