; DESCRIPTION: Composite: Places a cyan dot at position (213, 162) then Creates a white rectangular region at (6, 66) spanning 118 by 44 pixels.
; PLAN: r0=213(x), r1=162(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=6(x), r6=66(y), r7=118(width), r8=44(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 213
LDI r1, 162
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 6
LDI r6, 66
LDI r7, 118
LDI r8, 44
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
