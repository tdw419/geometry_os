; DESCRIPTION: Composite: Places a blue dot at position (214, 47) then Creates a yellow rectangular region at (207, 65) spanning 115 by 84 pixels.
; PLAN: r0=214(x), r1=47(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=207(x), r6=65(y), r7=115(width), r8=84(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 214
LDI r1, 47
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 207
LDI r6, 65
LDI r7, 115
LDI r8, 84
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
