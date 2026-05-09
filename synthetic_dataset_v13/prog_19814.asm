; DESCRIPTION: Composite: Renders a green box of size 101x72 starting at (197, 19) then Sets a single blue pixel at (119, 198).
; PLAN: r0=197(x), r1=19(y), r2=101(width), r3=72(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=119(x), r6=198(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 197
LDI r1, 19
LDI r2, 101
LDI r3, 72
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 119
LDI r6, 198
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
