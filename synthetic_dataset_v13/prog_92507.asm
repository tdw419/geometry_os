; DESCRIPTION: Composite: Sets a single blue pixel at (206, 135) then Creates a black rectangular region at (235, 205) spanning 40 by 20 pixels.
; PLAN: r0=206(x), r1=135(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=235(x), r6=205(y), r7=40(width), r8=20(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 206
LDI r1, 135
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 235
LDI r6, 205
LDI r7, 40
LDI r8, 20
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
