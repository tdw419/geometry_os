; DESCRIPTION: Composite: Places a purple dot at position (119, 194) then Creates a red rectangular region at (33, 119) spanning 98 by 61 pixels.
; PLAN: r0=119(x), r1=194(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=33(x), r6=119(y), r7=98(width), r8=61(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 119
LDI r1, 194
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 33
LDI r6, 119
LDI r7, 98
LDI r8, 61
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
