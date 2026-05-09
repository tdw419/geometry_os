; DESCRIPTION: Composite: Creates a blue circular shape at (254, 148) with radius 77 then Draws a white line from (279, 141) to (314, 192).
; PLAN: r0=254(x), r1=148(y), r2=77(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=279(x1), r6=141(y1), r7=314(x2), r8=192(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 254
LDI r1, 148
LDI r2, 77
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 279
LDI r6, 141
LDI r7, 314
LDI r8, 192
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
