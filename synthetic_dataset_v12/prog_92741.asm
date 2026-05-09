; DESCRIPTION: Composite: Creates a red rectangular region at (386, 33) spanning 84 by 84 pixels then Sets a single red pixel at (140, 200).
; PLAN: r0=386(x), r1=33(y), r2=84(width), r3=84(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=140(x), r6=200(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 386
LDI r1, 33
LDI r2, 84
LDI r3, 84
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 140
LDI r6, 200
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
