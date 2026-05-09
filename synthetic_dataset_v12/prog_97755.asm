; DESCRIPTION: Composite: Renders a cyan box of size 78x76 starting at (35, 58) then Sets a single yellow pixel at (355, 130).
; PLAN: r0=35(x), r1=58(y), r2=78(width), r3=76(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=355(x), r6=130(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 35
LDI r1, 58
LDI r2, 78
LDI r3, 76
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 355
LDI r6, 130
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
