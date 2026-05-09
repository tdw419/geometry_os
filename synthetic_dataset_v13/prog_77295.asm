; DESCRIPTION: Composite: Places a red 36x49 rectangle at position (280, 89) then Places a yellow circle of radius 16 at center (229, 204) then Sets a single orange pixel at (38, 115).
; PLAN: r0=280(x), r1=89(y), r2=36(width), r3=49(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=229(x), r6=204(y), r7=16(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=38(x), r11=115(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 280
LDI r1, 89
LDI r2, 36
LDI r3, 49
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 229
LDI r6, 204
LDI r7, 16
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 38
LDI r11, 115
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
