; DESCRIPTION: Composite: Sets a single cyan pixel at (153, 35) then Draws a white circle centered at (387, 132) with radius 61 then Draws a magenta rectangle at (327, 56) with width 80 and height 25.
; PLAN: r0=153(x), r1=35(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=387(x), r6=132(y), r7=61(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=327(x), r11=56(y), r12=80(width), r13=25(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 153
LDI r1, 35
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 387
LDI r6, 132
LDI r7, 61
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 327
LDI r11, 56
LDI r12, 80
LDI r13, 25
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
