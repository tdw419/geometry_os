; DESCRIPTION: Composite: Creates a cyan rectangular region at (164, 95) spanning 84 by 61 pixels then Places a cyan line segment connecting (501, 132) to (301, 204) then Sets a single green pixel at (407, 184).
; PLAN: r0=164(x), r1=95(y), r2=84(width), r3=61(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=501(x1), r6=132(y1), r7=301(x2), r8=204(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=407(x), r11=184(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 164
LDI r1, 95
LDI r2, 84
LDI r3, 61
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 501
LDI r6, 132
LDI r7, 301
LDI r8, 204
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 407
LDI r11, 184
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
