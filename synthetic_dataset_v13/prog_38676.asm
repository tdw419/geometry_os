; DESCRIPTION: Composite: Places a white dot at position (237, 127) then Creates a red rectangular region at (246, 75) spanning 77 by 58 pixels.
; PLAN: r0=237(x), r1=127(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=246(x), r6=75(y), r7=77(width), r8=58(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 237
LDI r1, 127
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 246
LDI r6, 75
LDI r7, 77
LDI r8, 58
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
