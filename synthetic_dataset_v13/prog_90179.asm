; DESCRIPTION: Composite: Sets a single black pixel at (231, 131) then Creates a orange rectangular region at (169, 123) spanning 40 by 22 pixels.
; PLAN: r0=231(x), r1=131(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=169(x), r6=123(y), r7=40(width), r8=22(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 231
LDI r1, 131
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 169
LDI r6, 123
LDI r7, 40
LDI r8, 22
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
