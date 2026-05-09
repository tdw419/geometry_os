; DESCRIPTION: Composite: Draws a cyan circle centered at (75, 177) with radius 74 then Draws a white line from (356, 156) to (291, 181).
; PLAN: r0=75(x), r1=177(y), r2=74(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=356(x1), r6=156(y1), r7=291(x2), r8=181(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 75
LDI r1, 177
LDI r2, 74
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 356
LDI r6, 156
LDI r7, 291
LDI r8, 181
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
