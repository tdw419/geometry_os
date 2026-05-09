; DESCRIPTION: Composite: Sets a single purple pixel at (60, 250) then Creates a black rectangular region at (2, 22) spanning 113 by 103 pixels.
; PLAN: r0=60(x), r1=250(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=2(x), r6=22(y), r7=113(width), r8=103(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 60
LDI r1, 250
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 2
LDI r6, 22
LDI r7, 113
LDI r8, 103
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
