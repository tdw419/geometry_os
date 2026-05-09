; DESCRIPTION: Composite: Renders a blue box of size 63x49 starting at (333, 81) then Sets a single red pixel at (299, 198).
; PLAN: r0=333(x), r1=81(y), r2=63(width), r3=49(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=299(x), r6=198(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 333
LDI r1, 81
LDI r2, 63
LDI r3, 49
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 299
LDI r6, 198
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
