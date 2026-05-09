; DESCRIPTION: Composite: Places a red 79x47 rectangle at position (420, 3) then Places a cyan line segment connecting (394, 175) to (269, 123) then Sets a single yellow pixel at (499, 212).
; PLAN: r0=420(x), r1=3(y), r2=79(width), r3=47(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=394(x1), r6=175(y1), r7=269(x2), r8=123(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=499(x), r11=212(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 420
LDI r1, 3
LDI r2, 79
LDI r3, 47
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 394
LDI r6, 175
LDI r7, 269
LDI r8, 123
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 499
LDI r11, 212
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
