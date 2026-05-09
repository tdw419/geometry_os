; DESCRIPTION: Composite: Draws a yellow line from (100, 1) to (5, 252) then Draws a blue rectangle at (233, 69) with width 23 and height 113 then Places a magenta dot at position (439, 28).
; PLAN: r0=100(x1), r1=1(y1), r2=5(x2), r3=252(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=233(x), r6=69(y), r7=23(width), r8=113(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=439(x), r11=28(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 100
LDI r1, 1
LDI r2, 5
LDI r3, 252
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 233
LDI r6, 69
LDI r7, 23
LDI r8, 113
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 439
LDI r11, 28
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
