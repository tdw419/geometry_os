; DESCRIPTION: Composite: Places a red circle of radius 44 at center (442, 137) then Places a black line segment connecting (1, 111) to (16, 34).
; PLAN: r0=442(x), r1=137(y), r2=44(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=1(x1), r6=111(y1), r7=16(x2), r8=34(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 442
LDI r1, 137
LDI r2, 44
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 1
LDI r6, 111
LDI r7, 16
LDI r8, 34
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
