; DESCRIPTION: Composite: Creates a white rectangular region at (60, 137) spanning 109 by 100 pixels then Places a green dot at position (468, 142).
; PLAN: r0=60(x), r1=137(y), r2=109(width), r3=100(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=468(x), r6=142(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 60
LDI r1, 137
LDI r2, 109
LDI r3, 100
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 468
LDI r6, 142
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
