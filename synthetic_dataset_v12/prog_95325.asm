; DESCRIPTION: Composite: Draws a red line from (433, 106) to (360, 205) then Renders a orange box of size 72x95 starting at (248, 35) then Places a magenta dot at position (76, 89).
; PLAN: r0=433(x1), r1=106(y1), r2=360(x2), r3=205(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=248(x), r6=35(y), r7=72(width), r8=95(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=76(x), r11=89(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 433
LDI r1, 106
LDI r2, 360
LDI r3, 205
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 248
LDI r6, 35
LDI r7, 72
LDI r8, 95
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 76
LDI r11, 89
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
