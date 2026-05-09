; DESCRIPTION: Composite: Places a cyan 87x95 rectangle at position (18, 135) then Renders a purple disk with center (217, 148) and radius 41 then Sets a single magenta pixel at (52, 99).
; PLAN: r0=18(x), r1=135(y), r2=87(width), r3=95(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=217(x), r6=148(y), r7=41(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=52(x), r11=99(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 18
LDI r1, 135
LDI r2, 87
LDI r3, 95
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 217
LDI r6, 148
LDI r7, 41
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 52
LDI r11, 99
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
