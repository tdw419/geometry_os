; DESCRIPTION: Composite: Draws a black circle centered at (100, 107) with radius 47 then Places a blue line segment connecting (367, 121) to (281, 8).
; PLAN: r0=100(x), r1=107(y), r2=47(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=367(x1), r6=121(y1), r7=281(x2), r8=8(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 100
LDI r1, 107
LDI r2, 47
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 367
LDI r6, 121
LDI r7, 281
LDI r8, 8
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
