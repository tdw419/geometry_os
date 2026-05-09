; DESCRIPTION: Composite: Creates a magenta rectangular region at (187, 141) spanning 29 by 39 pixels then Sets a single red pixel at (340, 253).
; PLAN: r0=187(x), r1=141(y), r2=29(width), r3=39(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=340(x), r6=253(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 187
LDI r1, 141
LDI r2, 29
LDI r3, 39
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 340
LDI r6, 253
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
