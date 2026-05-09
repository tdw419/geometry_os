; DESCRIPTION: Composite: Sets a single magenta pixel at (142, 182) then Creates a red rectangular region at (157, 33) spanning 113 by 63 pixels.
; PLAN: r0=142(x), r1=182(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=157(x), r6=33(y), r7=113(width), r8=63(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 142
LDI r1, 182
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 157
LDI r6, 33
LDI r7, 113
LDI r8, 63
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
