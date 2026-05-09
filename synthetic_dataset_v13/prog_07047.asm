; DESCRIPTION: Composite: Draws a red circle centered at (187, 72) with radius 65 then Sets a single cyan pixel at (236, 115).
; PLAN: r0=187(x), r1=72(y), r2=65(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=236(x), r6=115(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 187
LDI r1, 72
LDI r2, 65
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 236
LDI r6, 115
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
