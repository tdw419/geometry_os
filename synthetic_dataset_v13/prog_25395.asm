; DESCRIPTION: Composite: Places a black dot at position (31, 60) then Creates a cyan rectangular region at (388, 121) spanning 45 by 108 pixels then Draws a red line from (238, 23) to (76, 214).
; PLAN: r0=31(x), r1=60(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=388(x), r6=121(y), r7=45(width), r8=108(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=238(x1), r11=23(y1), r12=76(x2), r13=214(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 31
LDI r1, 60
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 388
LDI r6, 121
LDI r7, 45
LDI r8, 108
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 238
LDI r11, 23
LDI r12, 76
LDI r13, 214
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
