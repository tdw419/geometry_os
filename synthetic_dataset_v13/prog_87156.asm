; DESCRIPTION: Composite: Places a black dot at position (327, 40) then Draws a blue rectangle at (406, 169) with width 78 and height 39 then Renders a yellow disk with center (152, 45) and radius 16.
; PLAN: r0=327(x), r1=40(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=406(x), r6=169(y), r7=78(width), r8=39(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=152(x), r11=45(y), r12=16(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 327
LDI r1, 40
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 406
LDI r6, 169
LDI r7, 78
LDI r8, 39
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 152
LDI r11, 45
LDI r12, 16
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
