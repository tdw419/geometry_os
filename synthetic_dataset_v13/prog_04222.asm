; DESCRIPTION: Composite: Places a yellow line segment connecting (499, 5) to (128, 207) then Renders a black box of size 28x61 starting at (425, 195) then Creates a orange circular shape at (120, 117) with radius 13.
; PLAN: r0=499(x1), r1=5(y1), r2=128(x2), r3=207(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=425(x), r6=195(y), r7=28(width), r8=61(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=120(x), r11=117(y), r12=13(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 499
LDI r1, 5
LDI r2, 128
LDI r3, 207
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 425
LDI r6, 195
LDI r7, 28
LDI r8, 61
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 120
LDI r11, 117
LDI r12, 13
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
