; DESCRIPTION: Composite: Places a orange circle of radius 13 at center (104, 21) then Draws a orange rectangle at (398, 47) with width 108 and height 10 then Sets a single yellow pixel at (330, 70).
; PLAN: r0=104(x), r1=21(y), r2=13(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=398(x), r6=47(y), r7=108(width), r8=10(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=330(x), r11=70(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 104
LDI r1, 21
LDI r2, 13
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 398
LDI r6, 47
LDI r7, 108
LDI r8, 10
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 330
LDI r11, 70
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
