; DESCRIPTION: Composite: Creates a white circular shape at (177, 86) with radius 56 then Places a magenta dot at position (121, 188) then Places a orange line segment connecting (120, 204) to (121, 224).
; PLAN: r0=177(x), r1=86(y), r2=56(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=121(x), r6=188(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=120(x1), r11=204(y1), r12=121(x2), r13=224(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 177
LDI r1, 86
LDI r2, 56
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 121
LDI r6, 188
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 120
LDI r11, 204
LDI r12, 121
LDI r13, 224
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
