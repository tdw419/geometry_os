; DESCRIPTION: Composite: Sets a single yellow pixel at (349, 9) then Draws a orange rectangle at (191, 186) with width 87 and height 13.
; PLAN: r0=349(x), r1=9(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=191(x), r6=186(y), r7=87(width), r8=13(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 349
LDI r1, 9
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 191
LDI r6, 186
LDI r7, 87
LDI r8, 13
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
