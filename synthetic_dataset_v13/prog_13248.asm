; DESCRIPTION: Composite: Places a blue dot at position (186, 43) then Creates a black rectangular region at (42, 184) spanning 80 by 20 pixels.
; PLAN: r0=186(x), r1=43(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=42(x), r6=184(y), r7=80(width), r8=20(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 186
LDI r1, 43
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 42
LDI r6, 184
LDI r7, 80
LDI r8, 20
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
