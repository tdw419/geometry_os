; DESCRIPTION: Composite: Places a cyan circle of radius 60 at center (267, 143) then Renders a green box of size 100x83 starting at (20, 66) then Places a orange line segment connecting (272, 87) to (331, 242).
; PLAN: r0=267(x), r1=143(y), r2=60(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=20(x), r6=66(y), r7=100(width), r8=83(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=272(x1), r11=87(y1), r12=331(x2), r13=242(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 267
LDI r1, 143
LDI r2, 60
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 20
LDI r6, 66
LDI r7, 100
LDI r8, 83
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 272
LDI r11, 87
LDI r12, 331
LDI r13, 242
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
