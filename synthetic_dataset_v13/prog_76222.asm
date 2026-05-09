; DESCRIPTION: Composite: Places a green dot at position (121, 99) then Creates a green rectangular region at (301, 119) spanning 56 by 88 pixels.
; PLAN: r0=121(x), r1=99(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=301(x), r6=119(y), r7=56(width), r8=88(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 121
LDI r1, 99
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 301
LDI r6, 119
LDI r7, 56
LDI r8, 88
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
