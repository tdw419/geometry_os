; DESCRIPTION: Composite: Creates a green rectangular region at (337, 72) spanning 61 by 100 pixels then Places a black dot at position (327, 207).
; PLAN: r0=337(x), r1=72(y), r2=61(width), r3=100(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=327(x), r6=207(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 337
LDI r1, 72
LDI r2, 61
LDI r3, 100
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 327
LDI r6, 207
LDI r7, 0x000000
PSET r5, r6, r7
HALT
