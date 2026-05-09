; DESCRIPTION: Composite: Renders a orange box of size 90x115 starting at (380, 45) then Places a green line segment connecting (344, 255) to (450, 8) then Places a red dot at position (16, 85).
; PLAN: r0=380(x), r1=45(y), r2=90(width), r3=115(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=344(x1), r6=255(y1), r7=450(x2), r8=8(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=16(x), r11=85(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 380
LDI r1, 45
LDI r2, 90
LDI r3, 115
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 344
LDI r6, 255
LDI r7, 450
LDI r8, 8
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 16
LDI r11, 85
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
