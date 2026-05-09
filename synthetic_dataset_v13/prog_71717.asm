; DESCRIPTION: Composite: Renders a blue box of size 112x110 starting at (51, 55) then Sets a single yellow pixel at (13, 143).
; PLAN: r0=51(x), r1=55(y), r2=112(width), r3=110(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=13(x), r6=143(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 51
LDI r1, 55
LDI r2, 112
LDI r3, 110
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 13
LDI r6, 143
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
