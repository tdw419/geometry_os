; DESCRIPTION: Composite: Draws a white circle centered at (307, 137) with radius 30 then Draws a green line from (258, 130) to (25, 26).
; PLAN: r0=307(x), r1=137(y), r2=30(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=258(x1), r6=130(y1), r7=25(x2), r8=26(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 307
LDI r1, 137
LDI r2, 30
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 258
LDI r6, 130
LDI r7, 25
LDI r8, 26
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
