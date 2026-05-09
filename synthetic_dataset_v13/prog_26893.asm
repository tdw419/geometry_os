; DESCRIPTION: Composite: Places a green dot at position (299, 149) then Creates a blue rectangular region at (120, 55) spanning 105 by 46 pixels.
; PLAN: r0=299(x), r1=149(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=120(x), r6=55(y), r7=105(width), r8=46(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 299
LDI r1, 149
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 120
LDI r6, 55
LDI r7, 105
LDI r8, 46
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
