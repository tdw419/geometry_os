; DESCRIPTION: Composite: Places a cyan line segment connecting (263, 149) to (295, 25) then Draws a red rectangle at (187, 128) with width 79 and height 41 then Sets a single yellow pixel at (388, 233).
; PLAN: r0=263(x1), r1=149(y1), r2=295(x2), r3=25(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=187(x), r6=128(y), r7=79(width), r8=41(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=388(x), r11=233(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 263
LDI r1, 149
LDI r2, 295
LDI r3, 25
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 187
LDI r6, 128
LDI r7, 79
LDI r8, 41
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 388
LDI r11, 233
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
