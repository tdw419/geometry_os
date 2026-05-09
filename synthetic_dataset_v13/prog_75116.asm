; DESCRIPTION: Composite: Sets a single magenta pixel at (406, 247) then Creates a magenta rectangular region at (60, 124) spanning 98 by 59 pixels.
; PLAN: r0=406(x), r1=247(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=60(x), r6=124(y), r7=98(width), r8=59(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 406
LDI r1, 247
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 60
LDI r6, 124
LDI r7, 98
LDI r8, 59
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
