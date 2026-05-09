; DESCRIPTION: Composite: Places a white dot at position (153, 97) then Renders a yellow box of size 62x60 starting at (419, 185).
; PLAN: r0=153(x), r1=97(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=419(x), r6=185(y), r7=62(width), r8=60(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 153
LDI r1, 97
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 419
LDI r6, 185
LDI r7, 62
LDI r8, 60
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
