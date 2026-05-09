; DESCRIPTION: Composite: Places a green line segment connecting (67, 90) to (508, 38) then Places a magenta circle of radius 20 at center (354, 102).
; PLAN: r0=67(x1), r1=90(y1), r2=508(x2), r3=38(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=354(x), r6=102(y), r7=20(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 67
LDI r1, 90
LDI r2, 508
LDI r3, 38
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 354
LDI r6, 102
LDI r7, 20
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
