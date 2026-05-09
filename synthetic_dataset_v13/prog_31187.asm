; DESCRIPTION: Composite: Places a green dot at position (155, 188) then Creates a cyan rectangular region at (391, 44) spanning 87 by 63 pixels.
; PLAN: r0=155(x), r1=188(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=391(x), r6=44(y), r7=87(width), r8=63(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 155
LDI r1, 188
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 391
LDI r6, 44
LDI r7, 87
LDI r8, 63
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
