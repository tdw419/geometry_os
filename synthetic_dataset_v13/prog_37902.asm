; DESCRIPTION: Composite: Places a cyan dot at position (463, 201) then Creates a magenta rectangular region at (317, 140) spanning 32 by 48 pixels.
; PLAN: r0=463(x), r1=201(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=317(x), r6=140(y), r7=32(width), r8=48(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 463
LDI r1, 201
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 317
LDI r6, 140
LDI r7, 32
LDI r8, 48
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
