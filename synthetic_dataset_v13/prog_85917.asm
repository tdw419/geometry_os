; DESCRIPTION: Composite: Places a magenta dot at position (507, 145) then Creates a green rectangular region at (1, 43) spanning 100 by 117 pixels.
; PLAN: r0=507(x), r1=145(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=1(x), r6=43(y), r7=100(width), r8=117(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 507
LDI r1, 145
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 1
LDI r6, 43
LDI r7, 100
LDI r8, 117
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
