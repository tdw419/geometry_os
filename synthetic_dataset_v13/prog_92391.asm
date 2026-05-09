; DESCRIPTION: Composite: Draws a white line from (123, 63) to (127, 134) then Creates a orange circular shape at (367, 85) with radius 64.
; PLAN: r0=123(x1), r1=63(y1), r2=127(x2), r3=134(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=367(x), r6=85(y), r7=64(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 123
LDI r1, 63
LDI r2, 127
LDI r3, 134
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 367
LDI r6, 85
LDI r7, 64
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
