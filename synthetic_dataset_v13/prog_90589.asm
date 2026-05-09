; DESCRIPTION: Composite: Places a orange line segment connecting (230, 13) to (4, 161) then Places a green dot at position (21, 69) then Renders a white disk with center (54, 166) and radius 19.
; PLAN: r0=230(x1), r1=13(y1), r2=4(x2), r3=161(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=21(x), r6=69(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=54(x), r11=166(y), r12=19(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 230
LDI r1, 13
LDI r2, 4
LDI r3, 161
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 21
LDI r6, 69
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 54
LDI r11, 166
LDI r12, 19
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
