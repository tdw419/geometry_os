; DESCRIPTION: Composite: Draws a cyan rectangle at (328, 108) with width 76 and height 110 then Places a black line segment connecting (420, 79) to (383, 193) then Places a black dot at position (308, 233).
; PLAN: r0=328(x), r1=108(y), r2=76(width), r3=110(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=420(x1), r6=79(y1), r7=383(x2), r8=193(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=308(x), r11=233(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 328
LDI r1, 108
LDI r2, 76
LDI r3, 110
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 420
LDI r6, 79
LDI r7, 383
LDI r8, 193
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 308
LDI r11, 233
LDI r12, 0x000000
PSET r10, r11, r12
HALT
