; DESCRIPTION: Composite: Sets a single green pixel at (428, 56) then Draws a red rectangle at (260, 180) with width 53 and height 36 then Creates a magenta circular shape at (201, 108) with radius 38.
; PLAN: r0=428(x), r1=56(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=260(x), r6=180(y), r7=53(width), r8=36(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=201(x), r11=108(y), r12=38(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 428
LDI r1, 56
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 260
LDI r6, 180
LDI r7, 53
LDI r8, 36
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 201
LDI r11, 108
LDI r12, 38
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
