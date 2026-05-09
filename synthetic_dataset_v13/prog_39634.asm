; DESCRIPTION: Composite: Draws a white circle centered at (281, 180) with radius 55 then Places a red 44x47 rectangle at position (20, 122) then Places a magenta dot at position (232, 67).
; PLAN: r0=281(x), r1=180(y), r2=55(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=20(x), r6=122(y), r7=44(width), r8=47(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=232(x), r11=67(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 281
LDI r1, 180
LDI r2, 55
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 20
LDI r6, 122
LDI r7, 44
LDI r8, 47
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 232
LDI r11, 67
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
