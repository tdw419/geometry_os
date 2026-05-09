; DESCRIPTION: Composite: Draws a green rectangle at (124, 122) with width 91 and height 120 then Draws a magenta circle centered at (392, 112) with radius 75 then Places a magenta dot at position (471, 12).
; PLAN: r0=124(x), r1=122(y), r2=91(width), r3=120(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=392(x), r6=112(y), r7=75(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=471(x), r11=12(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 124
LDI r1, 122
LDI r2, 91
LDI r3, 120
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 392
LDI r6, 112
LDI r7, 75
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 471
LDI r11, 12
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
