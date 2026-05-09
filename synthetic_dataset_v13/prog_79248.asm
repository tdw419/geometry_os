; DESCRIPTION: Composite: Places a green dot at position (430, 57) then Creates a red rectangular region at (59, 217) spanning 104 by 17 pixels.
; PLAN: r0=430(x), r1=57(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=59(x), r6=217(y), r7=104(width), r8=17(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 430
LDI r1, 57
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 59
LDI r6, 217
LDI r7, 104
LDI r8, 17
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
