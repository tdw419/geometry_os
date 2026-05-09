; DESCRIPTION: Composite: Places a blue dot at position (171, 35) then Creates a cyan rectangular region at (188, 28) spanning 66 by 10 pixels.
; PLAN: r0=171(x), r1=35(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=188(x), r6=28(y), r7=66(width), r8=10(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 171
LDI r1, 35
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 188
LDI r6, 28
LDI r7, 66
LDI r8, 10
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
