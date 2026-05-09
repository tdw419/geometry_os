; DESCRIPTION: Composite: Renders a black disk with center (185, 174) and radius 73 then Places a yellow 13x116 rectangle at position (85, 132).
; PLAN: r0=185(x), r1=174(y), r2=73(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=85(x), r6=132(y), r7=13(width), r8=116(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 185
LDI r1, 174
LDI r2, 73
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 85
LDI r6, 132
LDI r7, 13
LDI r8, 116
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
