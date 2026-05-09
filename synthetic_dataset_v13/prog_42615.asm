; DESCRIPTION: Composite: Places a blue dot at position (6, 218) then Creates a yellow rectangular region at (411, 64) spanning 98 by 113 pixels.
; PLAN: r0=6(x), r1=218(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=411(x), r6=64(y), r7=98(width), r8=113(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 6
LDI r1, 218
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 411
LDI r6, 64
LDI r7, 98
LDI r8, 113
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
