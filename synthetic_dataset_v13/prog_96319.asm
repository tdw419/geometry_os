; DESCRIPTION: Composite: Creates a magenta rectangular region at (334, 32) spanning 95 by 50 pixels then Renders a blue line between points (277, 254) and (296, 84) then Places a magenta dot at position (375, 33).
; PLAN: r0=334(x), r1=32(y), r2=95(width), r3=50(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=277(x1), r6=254(y1), r7=296(x2), r8=84(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=375(x), r11=33(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 334
LDI r1, 32
LDI r2, 95
LDI r3, 50
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 277
LDI r6, 254
LDI r7, 296
LDI r8, 84
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 375
LDI r11, 33
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
