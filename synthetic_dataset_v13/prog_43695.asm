; DESCRIPTION: Composite: Creates a white rectangular region at (46, 103) spanning 77 by 88 pixels then Places a orange line segment connecting (450, 205) to (448, 86) then Sets a single cyan pixel at (349, 30).
; PLAN: r0=46(x), r1=103(y), r2=77(width), r3=88(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=450(x1), r6=205(y1), r7=448(x2), r8=86(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=349(x), r11=30(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 46
LDI r1, 103
LDI r2, 77
LDI r3, 88
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 450
LDI r6, 205
LDI r7, 448
LDI r8, 86
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 349
LDI r11, 30
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
