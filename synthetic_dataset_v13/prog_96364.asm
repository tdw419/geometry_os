; DESCRIPTION: Composite: Places a green 101x14 rectangle at position (235, 46) then Sets a single magenta pixel at (72, 212).
; PLAN: r0=235(x), r1=46(y), r2=101(width), r3=14(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=72(x), r6=212(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 235
LDI r1, 46
LDI r2, 101
LDI r3, 14
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 72
LDI r6, 212
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
