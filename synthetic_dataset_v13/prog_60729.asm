; DESCRIPTION: Composite: Renders a magenta line between points (86, 103) and (20, 44) then Renders a yellow box of size 75x24 starting at (436, 66) then Renders a blue disk with center (310, 92) and radius 33.
; PLAN: r0=86(x1), r1=103(y1), r2=20(x2), r3=44(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=436(x), r6=66(y), r7=75(width), r8=24(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=310(x), r11=92(y), r12=33(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 86
LDI r1, 103
LDI r2, 20
LDI r3, 44
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 436
LDI r6, 66
LDI r7, 75
LDI r8, 24
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 310
LDI r11, 92
LDI r12, 33
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
