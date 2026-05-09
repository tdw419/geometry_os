; DESCRIPTION: Composite: Places a blue line segment connecting (313, 86) to (154, 207) then Draws a yellow circle centered at (59, 142) with radius 37.
; PLAN: r0=313(x1), r1=86(y1), r2=154(x2), r3=207(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=59(x), r6=142(y), r7=37(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 313
LDI r1, 86
LDI r2, 154
LDI r3, 207
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 59
LDI r6, 142
LDI r7, 37
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
