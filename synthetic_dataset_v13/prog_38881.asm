; DESCRIPTION: Composite: Sets a single black pixel at (337, 240) then Places a cyan 115x95 rectangle at position (7, 145) then Renders a orange disk with center (402, 142) and radius 38.
; PLAN: r0=337(x), r1=240(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=7(x), r6=145(y), r7=115(width), r8=95(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=402(x), r11=142(y), r12=38(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 337
LDI r1, 240
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 7
LDI r6, 145
LDI r7, 115
LDI r8, 95
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 402
LDI r11, 142
LDI r12, 38
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
