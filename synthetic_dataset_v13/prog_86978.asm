; DESCRIPTION: Composite: Creates a white rectangular region at (32, 214) spanning 79 by 11 pixels then Sets a single black pixel at (346, 220).
; PLAN: r0=32(x), r1=214(y), r2=79(width), r3=11(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=346(x), r6=220(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 32
LDI r1, 214
LDI r2, 79
LDI r3, 11
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 346
LDI r6, 220
LDI r7, 0x000000
PSET r5, r6, r7
HALT
