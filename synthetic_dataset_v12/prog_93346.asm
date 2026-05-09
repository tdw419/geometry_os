; DESCRIPTION: Composite: Renders a yellow box of size 24x38 starting at (55, 73) then Sets a single yellow pixel at (324, 226).
; PLAN: r0=55(x), r1=73(y), r2=24(width), r3=38(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=324(x), r6=226(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 55
LDI r1, 73
LDI r2, 24
LDI r3, 38
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 324
LDI r6, 226
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
