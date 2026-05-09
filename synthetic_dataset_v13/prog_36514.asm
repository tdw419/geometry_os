; DESCRIPTION: Composite: Sets a single purple pixel at (128, 92) then Creates a yellow rectangular region at (394, 98) spanning 54 by 38 pixels.
; PLAN: r0=128(x), r1=92(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=394(x), r6=98(y), r7=54(width), r8=38(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 128
LDI r1, 92
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 394
LDI r6, 98
LDI r7, 54
LDI r8, 38
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
