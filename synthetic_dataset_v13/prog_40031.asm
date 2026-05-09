; DESCRIPTION: Composite: Creates a orange rectangular region at (161, 149) spanning 40 by 70 pixels then Draws a orange line from (344, 204) to (447, 123) then Places a magenta dot at position (446, 46).
; PLAN: r0=161(x), r1=149(y), r2=40(width), r3=70(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=344(x1), r6=204(y1), r7=447(x2), r8=123(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=446(x), r11=46(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 161
LDI r1, 149
LDI r2, 40
LDI r3, 70
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 344
LDI r6, 204
LDI r7, 447
LDI r8, 123
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 446
LDI r11, 46
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
