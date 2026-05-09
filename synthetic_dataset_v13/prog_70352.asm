; DESCRIPTION: Composite: Places a black dot at position (369, 110) then Creates a cyan rectangular region at (345, 86) spanning 120 by 107 pixels.
; PLAN: r0=369(x), r1=110(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=345(x), r6=86(y), r7=120(width), r8=107(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 369
LDI r1, 110
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 345
LDI r6, 86
LDI r7, 120
LDI r8, 107
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
