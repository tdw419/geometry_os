; DESCRIPTION: Composite: Draws a cyan line from (183, 142) to (138, 142) then Creates a orange circular shape at (175, 173) with radius 65.
; PLAN: r0=183(x1), r1=142(y1), r2=138(x2), r3=142(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=175(x), r6=173(y), r7=65(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 183
LDI r1, 142
LDI r2, 138
LDI r3, 142
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 175
LDI r6, 173
LDI r7, 65
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
