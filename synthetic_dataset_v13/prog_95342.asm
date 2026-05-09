; DESCRIPTION: Composite: Places a black dot at position (262, 244) then Places a green 105x105 rectangle at position (358, 65) then Renders a red disk with center (325, 32) and radius 32.
; PLAN: r0=262(x), r1=244(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=358(x), r6=65(y), r7=105(width), r8=105(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=325(x), r11=32(y), r12=32(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 262
LDI r1, 244
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 358
LDI r6, 65
LDI r7, 105
LDI r8, 105
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 325
LDI r11, 32
LDI r12, 32
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
