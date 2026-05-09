; DESCRIPTION: Composite: Creates a white circular shape at (427, 150) with radius 76 then Sets a single yellow pixel at (92, 247) then Places a yellow 68x47 rectangle at position (317, 74).
; PLAN: r0=427(x), r1=150(y), r2=76(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=92(x), r6=247(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=317(x), r11=74(y), r12=68(width), r13=47(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 427
LDI r1, 150
LDI r2, 76
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 92
LDI r6, 247
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 317
LDI r11, 74
LDI r12, 68
LDI r13, 47
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
