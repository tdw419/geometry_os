; DESCRIPTION: Composite: Sets a single white pixel at (370, 20) then Creates a magenta rectangular region at (261, 59) spanning 67 by 119 pixels.
; PLAN: r0=370(x), r1=20(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=261(x), r6=59(y), r7=67(width), r8=119(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 370
LDI r1, 20
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 261
LDI r6, 59
LDI r7, 67
LDI r8, 119
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
