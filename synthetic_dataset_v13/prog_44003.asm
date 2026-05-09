; DESCRIPTION: Composite: Places a white line segment connecting (373, 170) to (65, 22) then Places a yellow dot at position (494, 34) then Renders a green box of size 50x62 starting at (22, 89).
; PLAN: r0=373(x1), r1=170(y1), r2=65(x2), r3=22(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=494(x), r6=34(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=22(x), r11=89(y), r12=50(width), r13=62(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 373
LDI r1, 170
LDI r2, 65
LDI r3, 22
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 494
LDI r6, 34
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 22
LDI r11, 89
LDI r12, 50
LDI r13, 62
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
