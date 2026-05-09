; DESCRIPTION: Composite: Places a orange 50x37 rectangle at position (416, 171) then Places a black line segment connecting (405, 17) to (218, 158) then Places a red dot at position (329, 51).
; PLAN: r0=416(x), r1=171(y), r2=50(width), r3=37(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=405(x1), r6=17(y1), r7=218(x2), r8=158(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=329(x), r11=51(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 416
LDI r1, 171
LDI r2, 50
LDI r3, 37
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 405
LDI r6, 17
LDI r7, 218
LDI r8, 158
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 329
LDI r11, 51
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
