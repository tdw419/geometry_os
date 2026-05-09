; DESCRIPTION: Composite: Places a blue line segment connecting (486, 55) to (398, 0) then Draws a cyan rectangle at (372, 86) with width 20 and height 10 then Sets a single orange pixel at (344, 108).
; PLAN: r0=486(x1), r1=55(y1), r2=398(x2), r3=0(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=372(x), r6=86(y), r7=20(width), r8=10(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=344(x), r11=108(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 486
LDI r1, 55
LDI r2, 398
LDI r3, 0
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 372
LDI r6, 86
LDI r7, 20
LDI r8, 10
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 344
LDI r11, 108
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
