; DESCRIPTION: Composite: Places a magenta dot at position (496, 171) then Draws a cyan line from (410, 30) to (486, 137) then Creates a white rectangular region at (386, 137) spanning 119 by 47 pixels.
; PLAN: r0=496(x), r1=171(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=410(x1), r6=30(y1), r7=486(x2), r8=137(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=386(x), r11=137(y), r12=119(width), r13=47(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 496
LDI r1, 171
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 410
LDI r6, 30
LDI r7, 486
LDI r8, 137
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 386
LDI r11, 137
LDI r12, 119
LDI r13, 47
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
