; DESCRIPTION: Composite: Sets a single cyan pixel at (211, 148) then Creates a blue rectangular region at (0, 59) spanning 84 by 64 pixels.
; PLAN: r0=211(x), r1=148(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=0(x), r6=59(y), r7=84(width), r8=64(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 211
LDI r1, 148
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 0
LDI r6, 59
LDI r7, 84
LDI r8, 64
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
