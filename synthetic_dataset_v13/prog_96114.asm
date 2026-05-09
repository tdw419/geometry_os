; DESCRIPTION: Composite: Places a red 70x13 rectangle at position (353, 84) then Sets a single white pixel at (301, 208) then Draws a cyan line from (78, 134) to (301, 164).
; PLAN: r0=353(x), r1=84(y), r2=70(width), r3=13(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=301(x), r6=208(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=78(x1), r11=134(y1), r12=301(x2), r13=164(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 353
LDI r1, 84
LDI r2, 70
LDI r3, 13
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 301
LDI r6, 208
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 78
LDI r11, 134
LDI r12, 301
LDI r13, 164
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
