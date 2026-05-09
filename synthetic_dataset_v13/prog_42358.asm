; DESCRIPTION: Composite: Renders a blue box of size 95x67 starting at (138, 163) then Sets a single red pixel at (153, 246).
; PLAN: r0=138(x), r1=163(y), r2=95(width), r3=67(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=153(x), r6=246(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 138
LDI r1, 163
LDI r2, 95
LDI r3, 67
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 153
LDI r6, 246
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
