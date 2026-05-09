; DESCRIPTION: Composite: Places a white dot at position (84, 14) then Draws a white circle centered at (473, 143) with radius 23 then Places a blue 98x77 rectangle at position (171, 70).
; PLAN: r0=84(x), r1=14(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=473(x), r6=143(y), r7=23(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=171(x), r11=70(y), r12=98(width), r13=77(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 84
LDI r1, 14
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 473
LDI r6, 143
LDI r7, 23
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 171
LDI r11, 70
LDI r12, 98
LDI r13, 77
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
