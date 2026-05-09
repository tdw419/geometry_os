; DESCRIPTION: Composite: Places a white 77x70 rectangle at position (180, 4) then Places a green dot at position (151, 59) then Creates a blue circular shape at (405, 97) with radius 64.
; PLAN: r0=180(x), r1=4(y), r2=77(width), r3=70(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=151(x), r6=59(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=405(x), r11=97(y), r12=64(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 180
LDI r1, 4
LDI r2, 77
LDI r3, 70
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 151
LDI r6, 59
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 405
LDI r11, 97
LDI r12, 64
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
