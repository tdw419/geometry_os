; DESCRIPTION: Composite: Places a black line segment connecting (388, 219) to (339, 250) then Places a green 22x111 rectangle at position (190, 13).
; PLAN: r0=388(x1), r1=219(y1), r2=339(x2), r3=250(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=190(x), r6=13(y), r7=22(width), r8=111(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 388
LDI r1, 219
LDI r2, 339
LDI r3, 250
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 190
LDI r6, 13
LDI r7, 22
LDI r8, 111
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
