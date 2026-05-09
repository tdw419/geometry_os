; DESCRIPTION: Composite: Sets a single white pixel at (501, 3) then Creates a magenta rectangular region at (110, 47) spanning 64 by 77 pixels.
; PLAN: r0=501(x), r1=3(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=110(x), r6=47(y), r7=64(width), r8=77(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 501
LDI r1, 3
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 110
LDI r6, 47
LDI r7, 64
LDI r8, 77
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
