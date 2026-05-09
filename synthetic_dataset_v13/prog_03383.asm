; DESCRIPTION: Composite: Renders a cyan disk with center (57, 62) and radius 37 then Places a black dot at position (348, 21) then Places a purple 79x92 rectangle at position (80, 131).
; PLAN: r0=57(x), r1=62(y), r2=37(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=348(x), r6=21(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=80(x), r11=131(y), r12=79(width), r13=92(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 57
LDI r1, 62
LDI r2, 37
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 348
LDI r6, 21
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 80
LDI r11, 131
LDI r12, 79
LDI r13, 92
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
