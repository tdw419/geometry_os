; DESCRIPTION: Composite: Places a white 25x93 rectangle at position (307, 25) then Sets a single red pixel at (81, 128) then Renders a green disk with center (419, 76) and radius 75.
; PLAN: r0=307(x), r1=25(y), r2=25(width), r3=93(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=81(x), r6=128(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=419(x), r11=76(y), r12=75(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 307
LDI r1, 25
LDI r2, 25
LDI r3, 93
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 81
LDI r6, 128
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 419
LDI r11, 76
LDI r12, 75
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
