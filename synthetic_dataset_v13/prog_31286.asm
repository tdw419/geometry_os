; DESCRIPTION: Composite: Places a black dot at position (104, 226) then Creates a green rectangular region at (121, 75) spanning 55 by 75 pixels.
; PLAN: r0=104(x), r1=226(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=121(x), r6=75(y), r7=55(width), r8=75(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 104
LDI r1, 226
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 121
LDI r6, 75
LDI r7, 55
LDI r8, 75
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
