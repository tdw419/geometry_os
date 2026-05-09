; DESCRIPTION: Composite: Renders a white box of size 21x98 starting at (38, 57) then Draws a orange line from (160, 184) to (388, 117) then Sets a single white pixel at (415, 90).
; PLAN: r0=38(x), r1=57(y), r2=21(width), r3=98(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=160(x1), r6=184(y1), r7=388(x2), r8=117(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=415(x), r11=90(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 38
LDI r1, 57
LDI r2, 21
LDI r3, 98
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 160
LDI r6, 184
LDI r7, 388
LDI r8, 117
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 415
LDI r11, 90
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
