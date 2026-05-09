; DESCRIPTION: Composite: Sets a single yellow pixel at (403, 44) then Draws a green rectangle at (0, 65) with width 82 and height 85 then Renders a orange disk with center (54, 150) and radius 45.
; PLAN: r0=403(x), r1=44(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=0(x), r6=65(y), r7=82(width), r8=85(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=54(x), r11=150(y), r12=45(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 403
LDI r1, 44
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 0
LDI r6, 65
LDI r7, 82
LDI r8, 85
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 54
LDI r11, 150
LDI r12, 45
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
