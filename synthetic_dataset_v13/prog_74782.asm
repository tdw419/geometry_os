; DESCRIPTION: Composite: Sets a single blue pixel at (465, 121) then Creates a black rectangular region at (170, 194) spanning 56 by 52 pixels.
; PLAN: r0=465(x), r1=121(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=170(x), r6=194(y), r7=56(width), r8=52(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 465
LDI r1, 121
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 170
LDI r6, 194
LDI r7, 56
LDI r8, 52
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
