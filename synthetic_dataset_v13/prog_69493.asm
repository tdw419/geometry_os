; DESCRIPTION: Composite: Sets a single red pixel at (400, 93) then Creates a red rectangular region at (231, 81) spanning 96 by 99 pixels.
; PLAN: r0=400(x), r1=93(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=231(x), r6=81(y), r7=96(width), r8=99(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 400
LDI r1, 93
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 231
LDI r6, 81
LDI r7, 96
LDI r8, 99
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
