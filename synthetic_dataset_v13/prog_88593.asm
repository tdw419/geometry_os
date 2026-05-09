; DESCRIPTION: Composite: Places a green line segment connecting (209, 209) to (480, 79) then Places a white dot at position (23, 49) then Places a magenta 77x98 rectangle at position (431, 75).
; PLAN: r0=209(x1), r1=209(y1), r2=480(x2), r3=79(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=23(x), r6=49(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=431(x), r11=75(y), r12=77(width), r13=98(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 209
LDI r1, 209
LDI r2, 480
LDI r3, 79
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 23
LDI r6, 49
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 431
LDI r11, 75
LDI r12, 77
LDI r13, 98
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
