; DESCRIPTION: Composite: Renders a green box of size 90x63 starting at (315, 181) then Sets a single yellow pixel at (214, 140).
; PLAN: r0=315(x), r1=181(y), r2=90(width), r3=63(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=214(x), r6=140(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 315
LDI r1, 181
LDI r2, 90
LDI r3, 63
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 214
LDI r6, 140
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
