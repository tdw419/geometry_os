; DESCRIPTION: Composite: Draws a black line from (421, 108) to (455, 255) then Draws a red circle centered at (121, 148) with radius 16.
; PLAN: r0=421(x1), r1=108(y1), r2=455(x2), r3=255(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=121(x), r6=148(y), r7=16(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 421
LDI r1, 108
LDI r2, 455
LDI r3, 255
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 121
LDI r6, 148
LDI r7, 16
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
