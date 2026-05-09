; DESCRIPTION: Composite: Draws a cyan line from (148, 234) to (65, 201) then Places a orange 97x99 rectangle at position (385, 53) then Places a yellow dot at position (59, 85).
; PLAN: r0=148(x1), r1=234(y1), r2=65(x2), r3=201(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=385(x), r6=53(y), r7=97(width), r8=99(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=59(x), r11=85(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 148
LDI r1, 234
LDI r2, 65
LDI r3, 201
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 385
LDI r6, 53
LDI r7, 97
LDI r8, 99
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 59
LDI r11, 85
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
