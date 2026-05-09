; DESCRIPTION: Composite: Sets a single white pixel at (270, 108) then Places a red line segment connecting (489, 196) to (415, 102).
; PLAN: r0=270(x), r1=108(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=489(x1), r6=196(y1), r7=415(x2), r8=102(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 270
LDI r1, 108
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 489
LDI r6, 196
LDI r7, 415
LDI r8, 102
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
