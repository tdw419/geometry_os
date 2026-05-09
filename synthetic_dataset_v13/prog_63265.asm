; DESCRIPTION: Composite: Places a blue dot at position (406, 210) then Creates a orange rectangular region at (65, 211) spanning 114 by 14 pixels.
; PLAN: r0=406(x), r1=210(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=65(x), r6=211(y), r7=114(width), r8=14(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 406
LDI r1, 210
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 65
LDI r6, 211
LDI r7, 114
LDI r8, 14
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
