; DESCRIPTION: Composite: Creates a blue rectangular region at (422, 77) spanning 71 by 50 pixels then Places a purple dot at position (47, 14).
; PLAN: r0=422(x), r1=77(y), r2=71(width), r3=50(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=47(x), r6=14(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 422
LDI r1, 77
LDI r2, 71
LDI r3, 50
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 47
LDI r6, 14
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
