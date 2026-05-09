; DESCRIPTION: Composite: Renders a blue box of size 22x108 starting at (275, 28) then Sets a single yellow pixel at (77, 78).
; PLAN: r0=275(x), r1=28(y), r2=22(width), r3=108(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=77(x), r6=78(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 275
LDI r1, 28
LDI r2, 22
LDI r3, 108
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 77
LDI r6, 78
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
