; DESCRIPTION: Composite: Draws a white line from (228, 42) to (463, 157) then Places a blue dot at position (32, 213) then Creates a black circular shape at (247, 150) with radius 80.
; PLAN: r0=228(x1), r1=42(y1), r2=463(x2), r3=157(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=32(x), r6=213(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=247(x), r11=150(y), r12=80(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 228
LDI r1, 42
LDI r2, 463
LDI r3, 157
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 32
LDI r6, 213
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 247
LDI r11, 150
LDI r12, 80
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
