; DESCRIPTION: Composite: Sets a single red pixel at (255, 91) then Creates a green rectangular region at (227, 127) spanning 12 by 58 pixels.
; PLAN: r0=255(x), r1=91(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=227(x), r6=127(y), r7=12(width), r8=58(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 255
LDI r1, 91
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 227
LDI r6, 127
LDI r7, 12
LDI r8, 58
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
