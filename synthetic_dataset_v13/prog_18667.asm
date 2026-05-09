; DESCRIPTION: Composite: Sets a single purple pixel at (161, 136) then Creates a white rectangular region at (102, 208) spanning 42 by 46 pixels.
; PLAN: r0=161(x), r1=136(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=102(x), r6=208(y), r7=42(width), r8=46(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 161
LDI r1, 136
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 102
LDI r6, 208
LDI r7, 42
LDI r8, 46
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
