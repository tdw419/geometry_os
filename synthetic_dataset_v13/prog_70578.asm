; DESCRIPTION: Composite: Places a white dot at position (4, 117) then Creates a purple rectangular region at (53, 193) spanning 48 by 23 pixels.
; PLAN: r0=4(x), r1=117(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=53(x), r6=193(y), r7=48(width), r8=23(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 4
LDI r1, 117
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 53
LDI r6, 193
LDI r7, 48
LDI r8, 23
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
