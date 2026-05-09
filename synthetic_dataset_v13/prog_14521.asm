; DESCRIPTION: Composite: Places a blue 110x104 rectangle at position (24, 150) then Draws a cyan circle centered at (283, 105) with radius 59 then Places a red dot at position (434, 36).
; PLAN: r0=24(x), r1=150(y), r2=110(width), r3=104(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=283(x), r6=105(y), r7=59(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=434(x), r11=36(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 24
LDI r1, 150
LDI r2, 110
LDI r3, 104
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 283
LDI r6, 105
LDI r7, 59
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 434
LDI r11, 36
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
