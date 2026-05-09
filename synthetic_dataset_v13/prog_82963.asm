; DESCRIPTION: Composite: Creates a green rectangular region at (242, 60) spanning 76 by 60 pixels then Sets a single purple pixel at (455, 200).
; PLAN: r0=242(x), r1=60(y), r2=76(width), r3=60(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=455(x), r6=200(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 242
LDI r1, 60
LDI r2, 76
LDI r3, 60
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 455
LDI r6, 200
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
