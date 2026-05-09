; DESCRIPTION: Composite: Sets a single red pixel at (37, 177) then Places a orange line segment connecting (502, 44) to (103, 143) then Draws a magenta rectangle at (21, 93) with width 97 and height 49.
; PLAN: r0=37(x), r1=177(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=502(x1), r6=44(y1), r7=103(x2), r8=143(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=21(x), r11=93(y), r12=97(width), r13=49(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 37
LDI r1, 177
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 502
LDI r6, 44
LDI r7, 103
LDI r8, 143
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 21
LDI r11, 93
LDI r12, 97
LDI r13, 49
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
