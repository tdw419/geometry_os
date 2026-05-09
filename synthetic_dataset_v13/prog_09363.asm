; DESCRIPTION: Composite: Renders a green box of size 103x97 starting at (73, 108) then Places a orange line segment connecting (405, 142) to (440, 228) then Sets a single red pixel at (253, 31).
; PLAN: r0=73(x), r1=108(y), r2=103(width), r3=97(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=405(x1), r6=142(y1), r7=440(x2), r8=228(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=253(x), r11=31(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 73
LDI r1, 108
LDI r2, 103
LDI r3, 97
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 405
LDI r6, 142
LDI r7, 440
LDI r8, 228
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 253
LDI r11, 31
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
