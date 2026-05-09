; DESCRIPTION: Composite: Places a orange line segment connecting (111, 27) to (16, 19) then Places a red circle of radius 44 at center (226, 44).
; PLAN: r0=111(x1), r1=27(y1), r2=16(x2), r3=19(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=226(x), r6=44(y), r7=44(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 111
LDI r1, 27
LDI r2, 16
LDI r3, 19
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 226
LDI r6, 44
LDI r7, 44
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
