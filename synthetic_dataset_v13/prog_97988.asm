; DESCRIPTION: Composite: Places a blue dot at position (449, 15) then Draws a green circle centered at (57, 135) with radius 38 then Places a red line segment connecting (225, 243) to (43, 166).
; PLAN: r0=449(x), r1=15(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=57(x), r6=135(y), r7=38(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=225(x1), r11=243(y1), r12=43(x2), r13=166(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 449
LDI r1, 15
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 57
LDI r6, 135
LDI r7, 38
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 225
LDI r11, 243
LDI r12, 43
LDI r13, 166
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
