; DESCRIPTION: Composite: Renders a orange box of size 73x18 starting at (439, 202) then Draws a magenta line from (374, 143) to (60, 117) then Places a orange dot at position (153, 84).
; PLAN: r0=439(x), r1=202(y), r2=73(width), r3=18(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=374(x1), r6=143(y1), r7=60(x2), r8=117(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=153(x), r11=84(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 439
LDI r1, 202
LDI r2, 73
LDI r3, 18
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 374
LDI r6, 143
LDI r7, 60
LDI r8, 117
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 153
LDI r11, 84
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
