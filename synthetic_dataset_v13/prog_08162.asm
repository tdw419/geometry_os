; DESCRIPTION: Composite: Renders a cyan box of size 65x104 starting at (155, 72) then Sets a single white pixel at (24, 64).
; PLAN: r0=155(x), r1=72(y), r2=65(width), r3=104(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=24(x), r6=64(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 155
LDI r1, 72
LDI r2, 65
LDI r3, 104
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 24
LDI r6, 64
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
