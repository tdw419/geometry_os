; DESCRIPTION: Composite: Sets a single blue pixel at (225, 163) then Draws a magenta rectangle at (404, 79) with width 100 and height 19 then Creates a cyan circular shape at (91, 184) with radius 70.
; PLAN: r0=225(x), r1=163(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=404(x), r6=79(y), r7=100(width), r8=19(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=91(x), r11=184(y), r12=70(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 225
LDI r1, 163
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 404
LDI r6, 79
LDI r7, 100
LDI r8, 19
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 91
LDI r11, 184
LDI r12, 70
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
