; DESCRIPTION: Composite: Creates a purple rectangular region at (336, 13) spanning 70 by 20 pixels then Places a green dot at position (409, 19).
; PLAN: r0=336(x), r1=13(y), r2=70(width), r3=20(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=409(x), r6=19(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 336
LDI r1, 13
LDI r2, 70
LDI r3, 20
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 409
LDI r6, 19
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
