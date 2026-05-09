; DESCRIPTION: Composite: Sets a single green pixel at (92, 28) then Creates a magenta rectangular region at (160, 93) spanning 113 by 110 pixels.
; PLAN: r0=92(x), r1=28(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=160(x), r6=93(y), r7=113(width), r8=110(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 92
LDI r1, 28
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 160
LDI r6, 93
LDI r7, 113
LDI r8, 110
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
