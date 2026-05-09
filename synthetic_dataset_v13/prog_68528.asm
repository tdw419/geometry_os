; DESCRIPTION: Composite: Places a red dot at position (151, 80) then Creates a red rectangular region at (20, 165) spanning 13 by 54 pixels.
; PLAN: r0=151(x), r1=80(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=20(x), r6=165(y), r7=13(width), r8=54(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 151
LDI r1, 80
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 20
LDI r6, 165
LDI r7, 13
LDI r8, 54
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
