; DESCRIPTION: Composite: Draws a red rectangle at (191, 59) with width 49 and height 34 then Draws a orange line from (429, 80) to (426, 244) then Places a magenta dot at position (5, 82).
; PLAN: r0=191(x), r1=59(y), r2=49(width), r3=34(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=429(x1), r6=80(y1), r7=426(x2), r8=244(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=5(x), r11=82(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 191
LDI r1, 59
LDI r2, 49
LDI r3, 34
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 429
LDI r6, 80
LDI r7, 426
LDI r8, 244
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 5
LDI r11, 82
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
