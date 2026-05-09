; DESCRIPTION: Composite: Renders a magenta box of size 15x117 starting at (431, 33) then Sets a single green pixel at (371, 191).
; PLAN: r0=431(x), r1=33(y), r2=15(width), r3=117(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=371(x), r6=191(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 431
LDI r1, 33
LDI r2, 15
LDI r3, 117
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 371
LDI r6, 191
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
