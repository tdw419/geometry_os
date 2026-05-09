; DESCRIPTION: Composite: Places a red dot at position (289, 231) then Creates a white rectangular region at (80, 78) spanning 79 by 63 pixels.
; PLAN: r0=289(x), r1=231(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=80(x), r6=78(y), r7=79(width), r8=63(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 289
LDI r1, 231
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 80
LDI r6, 78
LDI r7, 79
LDI r8, 63
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
