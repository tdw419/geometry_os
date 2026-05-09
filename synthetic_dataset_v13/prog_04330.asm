; DESCRIPTION: Composite: Renders a cyan box of size 114x77 starting at (236, 64) then Sets a single yellow pixel at (116, 115).
; PLAN: r0=236(x), r1=64(y), r2=114(width), r3=77(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=116(x), r6=115(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 236
LDI r1, 64
LDI r2, 114
LDI r3, 77
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 116
LDI r6, 115
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
