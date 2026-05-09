; DESCRIPTION: Composite: Places a cyan dot at position (437, 223) then Creates a yellow rectangular region at (148, 135) spanning 63 by 47 pixels.
; PLAN: r0=437(x), r1=223(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=148(x), r6=135(y), r7=63(width), r8=47(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 437
LDI r1, 223
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 148
LDI r6, 135
LDI r7, 63
LDI r8, 47
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
