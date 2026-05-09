; DESCRIPTION: Composite: Places a red 80x37 rectangle at position (302, 202) then Draws a orange line from (249, 75) to (70, 127) then Renders a cyan disk with center (138, 47) and radius 39.
; PLAN: r0=302(x), r1=202(y), r2=80(width), r3=37(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=249(x1), r6=75(y1), r7=70(x2), r8=127(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=138(x), r11=47(y), r12=39(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 302
LDI r1, 202
LDI r2, 80
LDI r3, 37
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 249
LDI r6, 75
LDI r7, 70
LDI r8, 127
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 138
LDI r11, 47
LDI r12, 39
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
