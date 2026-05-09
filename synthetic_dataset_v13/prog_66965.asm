; DESCRIPTION: Composite: Draws a cyan line from (39, 104) to (106, 79) then Sets a single yellow pixel at (174, 194) then Draws a magenta rectangle at (360, 170) with width 77 and height 24.
; PLAN: r0=39(x1), r1=104(y1), r2=106(x2), r3=79(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=174(x), r6=194(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=360(x), r11=170(y), r12=77(width), r13=24(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 39
LDI r1, 104
LDI r2, 106
LDI r3, 79
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 174
LDI r6, 194
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 360
LDI r11, 170
LDI r12, 77
LDI r13, 24
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
