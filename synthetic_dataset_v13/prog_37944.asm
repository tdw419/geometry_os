; DESCRIPTION: Composite: Draws a orange line from (242, 149) to (286, 79) then Creates a purple rectangular region at (26, 1) spanning 108 by 82 pixels.
; PLAN: r0=242(x1), r1=149(y1), r2=286(x2), r3=79(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=26(x), r6=1(y), r7=108(width), r8=82(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 242
LDI r1, 149
LDI r2, 286
LDI r3, 79
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 26
LDI r6, 1
LDI r7, 108
LDI r8, 82
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
