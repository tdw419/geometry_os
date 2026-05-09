; DESCRIPTION: Composite: Draws a orange circle centered at (23, 58) with radius 19 then Draws a blue line from (90, 34) to (102, 27) then Places a white dot at position (205, 161).
; PLAN: r0=23(x), r1=58(y), r2=19(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=90(x1), r6=34(y1), r7=102(x2), r8=27(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=205(x), r11=161(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 23
LDI r1, 58
LDI r2, 19
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 90
LDI r6, 34
LDI r7, 102
LDI r8, 27
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 205
LDI r11, 161
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
