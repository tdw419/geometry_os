; DESCRIPTION: Composite: Places a black circle of radius 39 at center (281, 210) then Places a magenta line segment connecting (100, 56) to (11, 2).
; PLAN: r0=281(x), r1=210(y), r2=39(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=100(x1), r6=56(y1), r7=11(x2), r8=2(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 281
LDI r1, 210
LDI r2, 39
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 100
LDI r6, 56
LDI r7, 11
LDI r8, 2
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
