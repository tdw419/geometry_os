; DESCRIPTION: Composite: Places a orange circle of radius 20 at center (438, 76) then Renders a black line between points (263, 187) and (425, 62) then Places a cyan 73x33 rectangle at position (110, 3).
; PLAN: r0=438(x), r1=76(y), r2=20(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=263(x1), r6=187(y1), r7=425(x2), r8=62(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=110(x), r11=3(y), r12=73(width), r13=33(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 438
LDI r1, 76
LDI r2, 20
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 263
LDI r6, 187
LDI r7, 425
LDI r8, 62
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 110
LDI r11, 3
LDI r12, 73
LDI r13, 33
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
