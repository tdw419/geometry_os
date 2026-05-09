; DESCRIPTION: Composite: Creates a blue rectangular region at (290, 97) spanning 61 by 113 pixels then Sets a single purple pixel at (485, 111).
; PLAN: r0=290(x), r1=97(y), r2=61(width), r3=113(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=485(x), r6=111(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 290
LDI r1, 97
LDI r2, 61
LDI r3, 113
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 485
LDI r6, 111
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
