; DESCRIPTION: Composite: Places a black line segment connecting (70, 6) to (247, 105) then Places a yellow circle of radius 23 at center (292, 173).
; PLAN: r0=70(x1), r1=6(y1), r2=247(x2), r3=105(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=292(x), r6=173(y), r7=23(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 70
LDI r1, 6
LDI r2, 247
LDI r3, 105
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 292
LDI r6, 173
LDI r7, 23
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
