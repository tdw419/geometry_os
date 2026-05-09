; DESCRIPTION: Composite: Sets a single green pixel at (394, 186) then Creates a green rectangular region at (386, 124) spanning 22 by 11 pixels.
; PLAN: r0=394(x), r1=186(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=386(x), r6=124(y), r7=22(width), r8=11(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 394
LDI r1, 186
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 386
LDI r6, 124
LDI r7, 22
LDI r8, 11
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
