; DESCRIPTION: Composite: Places a cyan dot at position (58, 108) then Places a orange line segment connecting (43, 9) to (133, 40).
; PLAN: r0=58(x), r1=108(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=43(x1), r6=9(y1), r7=133(x2), r8=40(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 58
LDI r1, 108
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 43
LDI r6, 9
LDI r7, 133
LDI r8, 40
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
