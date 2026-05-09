; DESCRIPTION: Composite: Sets a single green pixel at (272, 103) then Creates a yellow rectangular region at (243, 65) spanning 71 by 55 pixels.
; PLAN: r0=272(x), r1=103(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=243(x), r6=65(y), r7=71(width), r8=55(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 272
LDI r1, 103
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 243
LDI r6, 65
LDI r7, 71
LDI r8, 55
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
