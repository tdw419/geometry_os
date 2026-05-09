; DESCRIPTION: Composite: Creates a green rectangular region at (173, 92) spanning 110 by 79 pixels then Places a white dot at position (234, 187).
; PLAN: r0=173(x), r1=92(y), r2=110(width), r3=79(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=234(x), r6=187(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 173
LDI r1, 92
LDI r2, 110
LDI r3, 79
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 234
LDI r6, 187
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
