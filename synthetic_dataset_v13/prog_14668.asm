; DESCRIPTION: Composite: Places a red 14x10 rectangle at position (33, 129) then Sets a single black pixel at (60, 32) then Renders a purple disk with center (159, 186) and radius 52.
; PLAN: r0=33(x), r1=129(y), r2=14(width), r3=10(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=60(x), r6=32(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=159(x), r11=186(y), r12=52(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 33
LDI r1, 129
LDI r2, 14
LDI r3, 10
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 60
LDI r6, 32
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 159
LDI r11, 186
LDI r12, 52
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
