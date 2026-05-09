; DESCRIPTION: Composite: Places a magenta dot at position (444, 96) then Creates a cyan rectangular region at (389, 26) spanning 29 by 88 pixels.
; PLAN: r0=444(x), r1=96(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=389(x), r6=26(y), r7=29(width), r8=88(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 444
LDI r1, 96
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 389
LDI r6, 26
LDI r7, 29
LDI r8, 88
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
