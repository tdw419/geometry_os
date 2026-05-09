; DESCRIPTION: Composite: Places a red line segment connecting (54, 59) to (225, 10) then Draws a yellow rectangle at (317, 106) with width 33 and height 116 then Places a orange dot at position (132, 228).
; PLAN: r0=54(x1), r1=59(y1), r2=225(x2), r3=10(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=317(x), r6=106(y), r7=33(width), r8=116(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=132(x), r11=228(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 54
LDI r1, 59
LDI r2, 225
LDI r3, 10
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 317
LDI r6, 106
LDI r7, 33
LDI r8, 116
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 132
LDI r11, 228
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
