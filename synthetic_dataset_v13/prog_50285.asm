; DESCRIPTION: Composite: Places a green 99x31 rectangle at position (391, 35) then Places a magenta line segment connecting (482, 31) to (58, 172) then Places a red dot at position (320, 142).
; PLAN: r0=391(x), r1=35(y), r2=99(width), r3=31(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=482(x1), r6=31(y1), r7=58(x2), r8=172(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=320(x), r11=142(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 391
LDI r1, 35
LDI r2, 99
LDI r3, 31
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 482
LDI r6, 31
LDI r7, 58
LDI r8, 172
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 320
LDI r11, 142
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
