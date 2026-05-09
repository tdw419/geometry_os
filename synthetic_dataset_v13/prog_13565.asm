; DESCRIPTION: Composite: Places a purple 41x104 rectangle at position (92, 8) then Renders a white disk with center (437, 99) and radius 72 then Sets a single red pixel at (27, 54).
; PLAN: r0=92(x), r1=8(y), r2=41(width), r3=104(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=437(x), r6=99(y), r7=72(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=27(x), r11=54(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 92
LDI r1, 8
LDI r2, 41
LDI r3, 104
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 437
LDI r6, 99
LDI r7, 72
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 27
LDI r11, 54
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
