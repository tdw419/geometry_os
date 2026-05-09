; DESCRIPTION: Composite: Creates a cyan rectangular region at (164, 145) spanning 40 by 108 pixels then Places a green dot at position (20, 123).
; PLAN: r0=164(x), r1=145(y), r2=40(width), r3=108(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=20(x), r6=123(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 164
LDI r1, 145
LDI r2, 40
LDI r3, 108
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 20
LDI r6, 123
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
