; DESCRIPTION: Composite: Places a blue line segment connecting (190, 179) to (458, 99) then Creates a orange rectangular region at (247, 79) spanning 101 by 101 pixels.
; PLAN: r0=190(x1), r1=179(y1), r2=458(x2), r3=99(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=247(x), r6=79(y), r7=101(width), r8=101(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 190
LDI r1, 179
LDI r2, 458
LDI r3, 99
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 247
LDI r6, 79
LDI r7, 101
LDI r8, 101
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
