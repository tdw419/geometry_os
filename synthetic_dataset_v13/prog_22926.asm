; DESCRIPTION: Composite: Draws a white circle centered at (64, 221) with radius 33 then Draws a yellow line from (241, 7) to (258, 88).
; PLAN: r0=64(x), r1=221(y), r2=33(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=241(x1), r6=7(y1), r7=258(x2), r8=88(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 64
LDI r1, 221
LDI r2, 33
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 241
LDI r6, 7
LDI r7, 258
LDI r8, 88
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
