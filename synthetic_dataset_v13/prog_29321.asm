; DESCRIPTION: Composite: Draws a blue rectangle at (366, 60) with width 99 and height 53 then Renders a red line between points (110, 34) and (305, 28) then Places a purple dot at position (225, 72).
; PLAN: r0=366(x), r1=60(y), r2=99(width), r3=53(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=110(x1), r6=34(y1), r7=305(x2), r8=28(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=225(x), r11=72(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 366
LDI r1, 60
LDI r2, 99
LDI r3, 53
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 110
LDI r6, 34
LDI r7, 305
LDI r8, 28
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 225
LDI r11, 72
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
