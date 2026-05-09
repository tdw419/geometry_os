; DESCRIPTION: Composite: Sets a single magenta pixel at (263, 112) then Creates a purple rectangular region at (54, 46) spanning 54 by 85 pixels.
; PLAN: r0=263(x), r1=112(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=54(x), r6=46(y), r7=54(width), r8=85(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 263
LDI r1, 112
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 54
LDI r6, 46
LDI r7, 54
LDI r8, 85
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
