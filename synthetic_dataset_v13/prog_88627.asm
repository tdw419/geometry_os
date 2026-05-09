; DESCRIPTION: Composite: Places a blue line segment connecting (61, 146) to (313, 94) then Draws a yellow circle centered at (157, 51) with radius 28.
; PLAN: r0=61(x1), r1=146(y1), r2=313(x2), r3=94(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=157(x), r6=51(y), r7=28(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 61
LDI r1, 146
LDI r2, 313
LDI r3, 94
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 157
LDI r6, 51
LDI r7, 28
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
