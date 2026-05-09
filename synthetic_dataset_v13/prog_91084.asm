; DESCRIPTION: Composite: Creates a blue rectangular region at (431, 111) spanning 37 by 73 pixels then Sets a single purple pixel at (400, 103).
; PLAN: r0=431(x), r1=111(y), r2=37(width), r3=73(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=400(x), r6=103(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 431
LDI r1, 111
LDI r2, 37
LDI r3, 73
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 400
LDI r6, 103
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
