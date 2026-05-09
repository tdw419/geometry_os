; DESCRIPTION: Composite: Places a magenta circle of radius 19 at center (63, 104) then Places a blue line segment connecting (119, 47) to (354, 108).
; PLAN: r0=63(x), r1=104(y), r2=19(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=119(x1), r6=47(y1), r7=354(x2), r8=108(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 63
LDI r1, 104
LDI r2, 19
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 119
LDI r6, 47
LDI r7, 354
LDI r8, 108
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
