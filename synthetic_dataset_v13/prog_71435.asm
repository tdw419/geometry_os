; DESCRIPTION: Composite: Places a cyan 12x102 rectangle at position (118, 131) then Sets a single orange pixel at (504, 121) then Renders a black disk with center (393, 82) and radius 36.
; PLAN: r0=118(x), r1=131(y), r2=12(width), r3=102(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=504(x), r6=121(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=393(x), r11=82(y), r12=36(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 118
LDI r1, 131
LDI r2, 12
LDI r3, 102
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 504
LDI r6, 121
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 393
LDI r11, 82
LDI r12, 36
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
