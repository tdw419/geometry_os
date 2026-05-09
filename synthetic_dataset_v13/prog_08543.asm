; DESCRIPTION: Composite: Renders a yellow box of size 112x17 starting at (222, 234) then Places a purple dot at position (23, 96).
; PLAN: r0=222(x), r1=234(y), r2=112(width), r3=17(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=23(x), r6=96(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 222
LDI r1, 234
LDI r2, 112
LDI r3, 17
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 23
LDI r6, 96
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
