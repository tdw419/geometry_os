; DESCRIPTION: Composite: Draws a white line from (510, 211) to (37, 184) then Draws a magenta circle centered at (412, 36) with radius 12.
; PLAN: r0=510(x1), r1=211(y1), r2=37(x2), r3=184(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=412(x), r6=36(y), r7=12(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 510
LDI r1, 211
LDI r2, 37
LDI r3, 184
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 412
LDI r6, 36
LDI r7, 12
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
