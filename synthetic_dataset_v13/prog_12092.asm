; DESCRIPTION: Composite: Creates a blue rectangular region at (409, 11) spanning 72 by 60 pixels then Places a yellow dot at position (380, 32).
; PLAN: r0=409(x), r1=11(y), r2=72(width), r3=60(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=380(x), r6=32(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 409
LDI r1, 11
LDI r2, 72
LDI r3, 60
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 380
LDI r6, 32
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
