; DESCRIPTION: Composite: Places a blue dot at position (236, 100) then Creates a blue rectangular region at (97, 163) spanning 91 by 21 pixels.
; PLAN: r0=236(x), r1=100(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=97(x), r6=163(y), r7=91(width), r8=21(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 236
LDI r1, 100
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 97
LDI r6, 163
LDI r7, 91
LDI r8, 21
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
