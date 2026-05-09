; DESCRIPTION: Composite: Draws a yellow rectangle at (218, 73) with width 26 and height 112 then Sets a single cyan pixel at (356, 110).
; PLAN: r0=218(x), r1=73(y), r2=26(width), r3=112(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=356(x), r6=110(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 218
LDI r1, 73
LDI r2, 26
LDI r3, 112
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 356
LDI r6, 110
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
