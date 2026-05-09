; DESCRIPTION: Composite: Renders a green line between points (62, 19) and (46, 116) then Renders a green box of size 63x91 starting at (156, 78) then Places a white dot at position (444, 60).
; PLAN: r0=62(x1), r1=19(y1), r2=46(x2), r3=116(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=156(x), r6=78(y), r7=63(width), r8=91(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=444(x), r11=60(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 62
LDI r1, 19
LDI r2, 46
LDI r3, 116
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 156
LDI r6, 78
LDI r7, 63
LDI r8, 91
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 444
LDI r11, 60
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
