; DESCRIPTION: Composite: Places a red 63x39 rectangle at position (113, 75) then Places a yellow dot at position (85, 223) then Renders a white disk with center (272, 48) and radius 43.
; PLAN: r0=113(x), r1=75(y), r2=63(width), r3=39(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=85(x), r6=223(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=272(x), r11=48(y), r12=43(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 113
LDI r1, 75
LDI r2, 63
LDI r3, 39
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 85
LDI r6, 223
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 272
LDI r11, 48
LDI r12, 43
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
