; DESCRIPTION: Composite: Draws a cyan line from (187, 225) to (38, 11) then Places a red dot at position (9, 85) then Creates a red rectangular region at (416, 85) spanning 53 by 77 pixels.
; PLAN: r0=187(x1), r1=225(y1), r2=38(x2), r3=11(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=9(x), r6=85(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=416(x), r11=85(y), r12=53(width), r13=77(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 187
LDI r1, 225
LDI r2, 38
LDI r3, 11
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 9
LDI r6, 85
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 416
LDI r11, 85
LDI r12, 53
LDI r13, 77
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
