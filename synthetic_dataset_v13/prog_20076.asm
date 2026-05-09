; DESCRIPTION: Composite: Draws a white line from (37, 111) to (392, 10) then Creates a orange rectangular region at (343, 135) spanning 76 by 79 pixels.
; PLAN: r0=37(x1), r1=111(y1), r2=392(x2), r3=10(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=343(x), r6=135(y), r7=76(width), r8=79(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 37
LDI r1, 111
LDI r2, 392
LDI r3, 10
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 343
LDI r6, 135
LDI r7, 76
LDI r8, 79
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
