; DESCRIPTION: Composite: Places a orange line segment connecting (249, 115) to (296, 184) then Creates a cyan rectangular region at (480, 54) spanning 11 by 46 pixels then Places a orange dot at position (124, 139).
; PLAN: r0=249(x1), r1=115(y1), r2=296(x2), r3=184(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=480(x), r6=54(y), r7=11(width), r8=46(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=124(x), r11=139(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 249
LDI r1, 115
LDI r2, 296
LDI r3, 184
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 480
LDI r6, 54
LDI r7, 11
LDI r8, 46
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 124
LDI r11, 139
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
