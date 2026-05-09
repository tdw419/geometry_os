; DESCRIPTION: Composite: Creates a orange circular shape at (128, 81) with radius 52 then Renders a blue line between points (42, 245) and (128, 110).
; PLAN: r0=128(x), r1=81(y), r2=52(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=42(x1), r6=245(y1), r7=128(x2), r8=110(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 128
LDI r1, 81
LDI r2, 52
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 42
LDI r6, 245
LDI r7, 128
LDI r8, 110
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
