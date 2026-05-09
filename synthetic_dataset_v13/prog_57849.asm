; DESCRIPTION: Composite: Sets a single orange pixel at (277, 97) then Creates a yellow rectangular region at (184, 47) spanning 40 by 87 pixels.
; PLAN: r0=277(x), r1=97(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=184(x), r6=47(y), r7=40(width), r8=87(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 277
LDI r1, 97
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 184
LDI r6, 47
LDI r7, 40
LDI r8, 87
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
