; DESCRIPTION: Composite: Places a purple dot at position (322, 0) then Creates a purple rectangular region at (281, 121) spanning 120 by 43 pixels.
; PLAN: r0=322(x), r1=0(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=281(x), r6=121(y), r7=120(width), r8=43(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 322
LDI r1, 0
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 281
LDI r6, 121
LDI r7, 120
LDI r8, 43
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
