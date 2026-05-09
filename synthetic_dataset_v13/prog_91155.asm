; DESCRIPTION: Composite: Renders a magenta box of size 99x115 starting at (155, 38) then Sets a single cyan pixel at (452, 53).
; PLAN: r0=155(x), r1=38(y), r2=99(width), r3=115(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=452(x), r6=53(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 155
LDI r1, 38
LDI r2, 99
LDI r3, 115
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 452
LDI r6, 53
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
