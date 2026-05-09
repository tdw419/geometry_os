; DESCRIPTION: Composite: Creates a green rectangular region at (410, 159) spanning 45 by 25 pixels then Sets a single magenta pixel at (53, 125).
; PLAN: r0=410(x), r1=159(y), r2=45(width), r3=25(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=53(x), r6=125(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 410
LDI r1, 159
LDI r2, 45
LDI r3, 25
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 53
LDI r6, 125
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
