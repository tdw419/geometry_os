; DESCRIPTION: Composite: Places a blue dot at position (270, 37) then Creates a magenta rectangular region at (312, 77) spanning 70 by 16 pixels.
; PLAN: r0=270(x), r1=37(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=312(x), r6=77(y), r7=70(width), r8=16(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 270
LDI r1, 37
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 312
LDI r6, 77
LDI r7, 70
LDI r8, 16
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
