; DESCRIPTION: Composite: Creates a orange circular shape at (426, 66) with radius 52 then Draws a blue line from (242, 45) to (223, 156).
; PLAN: r0=426(x), r1=66(y), r2=52(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=242(x1), r6=45(y1), r7=223(x2), r8=156(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 426
LDI r1, 66
LDI r2, 52
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 242
LDI r6, 45
LDI r7, 223
LDI r8, 156
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
