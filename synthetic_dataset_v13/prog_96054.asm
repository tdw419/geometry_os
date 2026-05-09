; DESCRIPTION: Composite: Places a white dot at position (220, 183) then Creates a green rectangular region at (400, 204) spanning 31 by 49 pixels.
; PLAN: r0=220(x), r1=183(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=400(x), r6=204(y), r7=31(width), r8=49(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 220
LDI r1, 183
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 400
LDI r6, 204
LDI r7, 31
LDI r8, 49
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
