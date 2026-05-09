; DESCRIPTION: Composite: Draws a cyan rectangle at (398, 149) with width 49 and height 21 then Draws a blue line from (41, 152) to (18, 217) then Sets a single yellow pixel at (463, 255).
; PLAN: r0=398(x), r1=149(y), r2=49(width), r3=21(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=41(x1), r6=152(y1), r7=18(x2), r8=217(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=463(x), r11=255(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 398
LDI r1, 149
LDI r2, 49
LDI r3, 21
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 41
LDI r6, 152
LDI r7, 18
LDI r8, 217
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 463
LDI r11, 255
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
