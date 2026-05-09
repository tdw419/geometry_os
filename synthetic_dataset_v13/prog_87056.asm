; DESCRIPTION: Composite: Places a green dot at position (460, 48) then Creates a orange rectangular region at (431, 141) spanning 17 by 110 pixels.
; PLAN: r0=460(x), r1=48(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=431(x), r6=141(y), r7=17(width), r8=110(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 460
LDI r1, 48
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 431
LDI r6, 141
LDI r7, 17
LDI r8, 110
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
