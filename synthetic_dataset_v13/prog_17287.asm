; DESCRIPTION: Composite: Places a blue line segment connecting (382, 151) to (486, 129) then Places a magenta circle of radius 47 at center (90, 84).
; PLAN: r0=382(x1), r1=151(y1), r2=486(x2), r3=129(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=90(x), r6=84(y), r7=47(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 382
LDI r1, 151
LDI r2, 486
LDI r3, 129
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 90
LDI r6, 84
LDI r7, 47
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
