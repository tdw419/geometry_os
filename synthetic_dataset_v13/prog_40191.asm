; DESCRIPTION: Composite: Creates a cyan rectangular region at (357, 67) spanning 89 by 106 pixels then Places a green dot at position (132, 143).
; PLAN: r0=357(x), r1=67(y), r2=89(width), r3=106(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=132(x), r6=143(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 357
LDI r1, 67
LDI r2, 89
LDI r3, 106
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 132
LDI r6, 143
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
