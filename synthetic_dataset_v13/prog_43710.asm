; DESCRIPTION: Composite: Draws a white rectangle at (186, 31) with width 26 and height 25 then Places a red dot at position (300, 11) then Places a cyan line segment connecting (102, 17) to (446, 244).
; PLAN: r0=186(x), r1=31(y), r2=26(width), r3=25(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=300(x), r6=11(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=102(x1), r11=17(y1), r12=446(x2), r13=244(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 186
LDI r1, 31
LDI r2, 26
LDI r3, 25
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 300
LDI r6, 11
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 102
LDI r11, 17
LDI r12, 446
LDI r13, 244
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
