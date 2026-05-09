; DESCRIPTION: Composite: Draws a white rectangle at (258, 200) with width 31 and height 12 then Places a green line segment connecting (245, 21) to (450, 45) then Places a red dot at position (321, 114).
; PLAN: r0=258(x), r1=200(y), r2=31(width), r3=12(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=245(x1), r6=21(y1), r7=450(x2), r8=45(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=321(x), r11=114(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 258
LDI r1, 200
LDI r2, 31
LDI r3, 12
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 245
LDI r6, 21
LDI r7, 450
LDI r8, 45
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 321
LDI r11, 114
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
