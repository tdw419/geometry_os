; DESCRIPTION: Composite: Draws a cyan line from (399, 114) to (198, 33) then Creates a blue circular shape at (333, 142) with radius 62.
; PLAN: r0=399(x1), r1=114(y1), r2=198(x2), r3=33(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=333(x), r6=142(y), r7=62(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 399
LDI r1, 114
LDI r2, 198
LDI r3, 33
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 333
LDI r6, 142
LDI r7, 62
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
