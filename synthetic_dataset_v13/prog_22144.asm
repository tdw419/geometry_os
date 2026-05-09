; DESCRIPTION: Composite: Places a black line segment connecting (6, 166) to (349, 189) then Places a magenta circle of radius 77 at center (92, 101).
; PLAN: r0=6(x1), r1=166(y1), r2=349(x2), r3=189(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=92(x), r6=101(y), r7=77(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 6
LDI r1, 166
LDI r2, 349
LDI r3, 189
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 92
LDI r6, 101
LDI r7, 77
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
