; DESCRIPTION: Composite: Places a black dot at position (63, 152) then Creates a orange rectangular region at (376, 131) spanning 46 by 94 pixels.
; PLAN: r0=63(x), r1=152(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=376(x), r6=131(y), r7=46(width), r8=94(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 63
LDI r1, 152
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 376
LDI r6, 131
LDI r7, 46
LDI r8, 94
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
