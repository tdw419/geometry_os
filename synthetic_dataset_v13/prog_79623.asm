; DESCRIPTION: Composite: Sets a single blue pixel at (81, 204) then Creates a magenta rectangular region at (320, 5) spanning 113 by 25 pixels.
; PLAN: r0=81(x), r1=204(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=320(x), r6=5(y), r7=113(width), r8=25(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 81
LDI r1, 204
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 320
LDI r6, 5
LDI r7, 113
LDI r8, 25
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
