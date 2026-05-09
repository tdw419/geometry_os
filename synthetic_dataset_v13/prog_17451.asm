; DESCRIPTION: Composite: Draws a orange line from (380, 250) to (245, 242) then Creates a magenta rectangular region at (164, 59) spanning 21 by 85 pixels then Places a magenta dot at position (165, 206).
; PLAN: r0=380(x1), r1=250(y1), r2=245(x2), r3=242(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=164(x), r6=59(y), r7=21(width), r8=85(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=165(x), r11=206(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 380
LDI r1, 250
LDI r2, 245
LDI r3, 242
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 164
LDI r6, 59
LDI r7, 21
LDI r8, 85
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 165
LDI r11, 206
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
