; DESCRIPTION: Composite: Draws a blue rectangle at (85, 47) with width 64 and height 41 then Sets a single yellow pixel at (60, 140) then Draws a red circle centered at (77, 143) with radius 70.
; PLAN: r0=85(x), r1=47(y), r2=64(width), r3=41(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=60(x), r6=140(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=77(x), r11=143(y), r12=70(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 85
LDI r1, 47
LDI r2, 64
LDI r3, 41
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 60
LDI r6, 140
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 77
LDI r11, 143
LDI r12, 70
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
