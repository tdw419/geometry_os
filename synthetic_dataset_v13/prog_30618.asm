; DESCRIPTION: Composite: Creates a green rectangular region at (440, 84) spanning 40 by 27 pixels then Sets a single red pixel at (61, 221).
; PLAN: r0=440(x), r1=84(y), r2=40(width), r3=27(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=61(x), r6=221(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 440
LDI r1, 84
LDI r2, 40
LDI r3, 27
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 61
LDI r6, 221
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
