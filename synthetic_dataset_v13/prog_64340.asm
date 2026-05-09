; DESCRIPTION: Composite: Places a blue line segment connecting (473, 82) to (465, 108) then Draws a blue circle centered at (280, 130) with radius 80.
; PLAN: r0=473(x1), r1=82(y1), r2=465(x2), r3=108(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=280(x), r6=130(y), r7=80(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 473
LDI r1, 82
LDI r2, 465
LDI r3, 108
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 280
LDI r6, 130
LDI r7, 80
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
