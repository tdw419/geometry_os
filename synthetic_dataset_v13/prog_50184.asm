; DESCRIPTION: Composite: Places a cyan 23x93 rectangle at position (447, 47) then Sets a single orange pixel at (51, 238) then Places a white circle of radius 67 at center (152, 71).
; PLAN: r0=447(x), r1=47(y), r2=23(width), r3=93(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=51(x), r6=238(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=152(x), r11=71(y), r12=67(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 447
LDI r1, 47
LDI r2, 23
LDI r3, 93
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 51
LDI r6, 238
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 152
LDI r11, 71
LDI r12, 67
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
