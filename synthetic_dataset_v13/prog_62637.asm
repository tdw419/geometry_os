; DESCRIPTION: Composite: Places a cyan line segment connecting (338, 197) to (406, 110) then Renders a black disk with center (23, 135) and radius 10.
; PLAN: r0=338(x1), r1=197(y1), r2=406(x2), r3=110(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=23(x), r6=135(y), r7=10(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 338
LDI r1, 197
LDI r2, 406
LDI r3, 110
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 23
LDI r6, 135
LDI r7, 10
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
