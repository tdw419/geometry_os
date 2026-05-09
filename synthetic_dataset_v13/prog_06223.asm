; DESCRIPTION: Composite: Places a white dot at position (32, 194) then Creates a red rectangular region at (329, 26) spanning 22 by 30 pixels.
; PLAN: r0=32(x), r1=194(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=329(x), r6=26(y), r7=22(width), r8=30(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 32
LDI r1, 194
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 329
LDI r6, 26
LDI r7, 22
LDI r8, 30
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
