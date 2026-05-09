; DESCRIPTION: Composite: Places a white 77x84 rectangle at position (217, 133) then Places a white circle of radius 67 at center (426, 170) then Places a blue dot at position (68, 113).
; PLAN: r0=217(x), r1=133(y), r2=77(width), r3=84(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=426(x), r6=170(y), r7=67(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=68(x), r11=113(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 217
LDI r1, 133
LDI r2, 77
LDI r3, 84
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 426
LDI r6, 170
LDI r7, 67
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 68
LDI r11, 113
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
