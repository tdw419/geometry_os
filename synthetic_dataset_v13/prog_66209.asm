; DESCRIPTION: Composite: Draws a green line from (225, 79) to (23, 124) then Renders a white box of size 82x54 starting at (17, 112) then Sets a single orange pixel at (176, 224).
; PLAN: r0=225(x1), r1=79(y1), r2=23(x2), r3=124(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=17(x), r6=112(y), r7=82(width), r8=54(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=176(x), r11=224(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 225
LDI r1, 79
LDI r2, 23
LDI r3, 124
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 17
LDI r6, 112
LDI r7, 82
LDI r8, 54
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 176
LDI r11, 224
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
