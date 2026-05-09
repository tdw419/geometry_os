; DESCRIPTION: Composite: Places a green circle of radius 45 at center (365, 201) then Places a blue line segment connecting (45, 28) to (255, 151).
; PLAN: r0=365(x), r1=201(y), r2=45(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=45(x1), r6=28(y1), r7=255(x2), r8=151(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 365
LDI r1, 201
LDI r2, 45
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 45
LDI r6, 28
LDI r7, 255
LDI r8, 151
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
