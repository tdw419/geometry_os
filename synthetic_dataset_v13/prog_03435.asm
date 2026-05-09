; DESCRIPTION: Composite: Draws a white line from (261, 79) to (216, 123) then Renders a orange disk with center (291, 131) and radius 42.
; PLAN: r0=261(x1), r1=79(y1), r2=216(x2), r3=123(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=291(x), r6=131(y), r7=42(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 261
LDI r1, 79
LDI r2, 216
LDI r3, 123
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 291
LDI r6, 131
LDI r7, 42
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
