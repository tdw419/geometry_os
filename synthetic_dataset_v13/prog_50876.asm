; DESCRIPTION: Composite: Creates a purple rectangular region at (403, 53) spanning 43 by 115 pixels then Places a cyan dot at position (78, 10).
; PLAN: r0=403(x), r1=53(y), r2=43(width), r3=115(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=78(x), r6=10(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 403
LDI r1, 53
LDI r2, 43
LDI r3, 115
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 78
LDI r6, 10
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
