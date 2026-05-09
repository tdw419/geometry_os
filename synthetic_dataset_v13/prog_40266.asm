; DESCRIPTION: Composite: Places a yellow dot at position (360, 18) then Creates a purple rectangular region at (352, 86) spanning 114 by 38 pixels.
; PLAN: r0=360(x), r1=18(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=352(x), r6=86(y), r7=114(width), r8=38(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 360
LDI r1, 18
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 352
LDI r6, 86
LDI r7, 114
LDI r8, 38
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
