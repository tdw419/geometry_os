; DESCRIPTION: Composite: Renders a orange disk with center (361, 42) and radius 37 then Draws a yellow line from (494, 29) to (442, 56).
; PLAN: r0=361(x), r1=42(y), r2=37(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=494(x1), r6=29(y1), r7=442(x2), r8=56(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 361
LDI r1, 42
LDI r2, 37
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 494
LDI r6, 29
LDI r7, 442
LDI r8, 56
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
