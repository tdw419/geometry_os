; DESCRIPTION: Composite: Renders a green box of size 88x111 starting at (350, 0) then Sets a single magenta pixel at (159, 25).
; PLAN: r0=350(x), r1=0(y), r2=88(width), r3=111(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=159(x), r6=25(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 350
LDI r1, 0
LDI r2, 88
LDI r3, 111
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 159
LDI r6, 25
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
