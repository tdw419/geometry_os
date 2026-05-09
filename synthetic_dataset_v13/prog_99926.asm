; DESCRIPTION: Composite: Draws a yellow rectangle at (118, 91) with width 44 and height 92 then Sets a single cyan pixel at (462, 64).
; PLAN: r0=118(x), r1=91(y), r2=44(width), r3=92(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=462(x), r6=64(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 118
LDI r1, 91
LDI r2, 44
LDI r3, 92
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 462
LDI r6, 64
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
